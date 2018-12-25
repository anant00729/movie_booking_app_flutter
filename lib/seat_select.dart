import 'dart:async';

import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SeatSelect extends StatefulWidget {
  @override
  _SeatSelectState createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  List<dynamic> mData;

  void _fetchSeatLayoutData() async {
    //print('${BASE_URL}Booking/GetSeatLayout/?ScheduleTimeID=186&CinemaScheduleID=188&CategoryID=4&Type=Public');

    //final res = await http.get('${BASE_URL}Booking/GetSeatLayout/?ScheduleTimeID=186&CinemaScheduleID=188&CategoryID=4&Type=Public');

    final res = await http.get('http://192.168.1.28:3000/');


    if(res.statusCode == 200){

      final d = json.decode(res.body);

      print(d);
      if(d['Row'] == d['Column']){
        int total = d['SeatLayouts'].length * 2;

        mData = await processData(d,total);
        setState(() {});
      }

    }
  }


  Future<List<dynamic>> processData(var d,var total) async {

    List<dynamic> mData = new List();


    int c = 0;
    for (int i = 0; i < total; i++) {

      // for odd 1,3,5..
      if(i % 2 == 1){
        d['SeatLayouts'][c]['column_no'] = d['Column'];
        d['SeatLayouts'][c]['row_no'] = d['Row'];
        //int k = 0;
        for (var seat_l in d['SeatLayouts']) {
          for (int j = 0; j < seat_l['Seats'].length; j++) {
            //var seat = seat_l['Seats'][j];
            int row = (j / d['Column']).toInt();
            seat_l['Seats'][j]['row_number'] = row;
          }
          //++k;
        }
        mData.add(d['SeatLayouts'][c]);
        ++c;
      }
      // for even 0,2,4,6
      else {
        mData.add(d['SeatTypes'][c]);
      }
    }

    return mData;
  }


  @override
  void initState() {
    super.initState();
    _fetchSeatLayoutData();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body:
      Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 155,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage('images/seat_layout_top_back.png'),
                      fit: BoxFit.scaleDown
                  ),
                ),
                child: Center(
                  child: Text('Movie Screen', style: TextStyle(fontSize: 18.0),),
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: InkWell(
                  splashColor: Colors.grey,
                  child: Container(
//                  color: Colors.purple,
                    height: h * 0.17,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(22, 32, 22, 24),
                      child: Icon(Icons.arrow_back, size: 28.0,),
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
          Container(
            color: Colors.grey,
            height: 60,
          ),
          mData != null ?
          Expanded(
            child: MediaQuery(data: MediaQuery.of(context).removePadding(
              removeTop: true
            ),
              child: ListView.builder(
              itemCount: mData.length,
              itemBuilder: (context,i){
                return BuildSeatLayout(i,context);
              }))
          ) : Center(child: CircularProgressIndicator(),)

        ],
      )
    );
  }

  Widget BuildSeatLayout(int i, BuildContext context) {

    print(mData[i]);
    if (i % 2 == 0){
      return Container(
//        color: Colors.yellow,
        height: 30, child: Center(child: Text('${mData[i]['Label']} : \$${mData[i]['Price']}'),),);
    } else {


//      Expanded(
//              child: GridView.builder(
//                  itemCount: 20,
//                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
//                  itemBuilder: (context, i){
//                    return Text('hell');
//                  })
//            );

      int row_no = mData[i]['row_no'] - 1;
      int col_no = mData[i]['column_no'] - 1;
      var seat = mData[i]['Seats'];

      return
          Container(
//            width: 1000,
//            height: 500.0,
            height: (row_no * 40).toDouble(),
//            color: Colors.green,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

                Container(
//                  width: 320,
                  height: 1000,
                  width: (col_no * 40).toDouble(),
//                  color: Colors.red,
                  child: GridView.builder(

//                scrollDirection: Axis.horizontal,
                      physics: new NeverScrollableScrollPhysics(),
                      itemCount: mData[i]['Seats'].length,
//gridDelegate: SilverGrid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                      itemBuilder: (context, j){
                        var s = SeatStatus(seat[j]['Status']);
                        return SizedBox.fromSize(
                          size: Size(20, 20),
                          child:
                          InkWell(
                            child: Card(
                                color: s.color,
//                              color: Colors.black12,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0))),
                                child: Center(child: Text(seat[j]['SeatName'], style: s.textStyle,))),
                            onTap: (){
                              seat[j]['Status'] = 3;
                              setState(() {
                              });
                              print('hello all');
                            },
                          )

                        );

                      }),
                ),
              ],
            )


            ,
          );

    }
  }
}


class SeatStatus {
  var color;
  var textStyle;

  SeatStatus(s){
    switch(s){
      case 1:
        this.color = Colors.black12;
        this.textStyle = TextStyle(color: Colors.white);
        break;
      case 2:
        this.color = Colors.grey;
        this.textStyle = TextStyle(color: Colors.white);
        break;
      case 3:
        this.color = Color(0xff90FBDC);
        this.textStyle = TextStyle(color: Colors.black);
        break;
      default:
        this.color = Colors.black12;
        this.textStyle = TextStyle(color: Colors.white);
        break;

    }
  }

}



//Expanded(
//child: MediaQuery(
//data: MediaQuery.of(context).removePadding(
//removeTop: true),
//child: GridView.builder(
//itemCount: 10,
//gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
//itemBuilder: (context, i){
//return Text('hello all');
//})
//)
//
//
//)

//seat[i]['SeatName']

//http://gogophp.binarynumbers.io/api/Booking/GetSeatLayout?ScheduleTimeID=186&CinemaScheduleID=188&CategoryID=4&Type=Public
