import 'dart:async';

import 'package:cinema_booking_app/app_models.dart';
import 'package:cinema_booking_app/start_booking.dart';
import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class SeatSelect extends StatefulWidget {


  final cat_id;
  final c_s_id;
  final show_type;

  SeatSelect({Key key,this.cat_id,this.c_s_id,this.show_type}) : super(key : key);

  @override
  _SeatSelectState createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {
  List<dynamic> mData;
  List<dynamic> mS_s;
  int Qty = 0;
  int initQty = 5;
  double total_price = 0.0;
  List<DeselectSeat> d_l;



  void _fetchSeatLayoutData() async {

    try{


      final cat_id = widget.cat_id;
      final c_s_id = widget.c_s_id;
      final show_type = widget.show_type;

      print('POST --->' + "${BASE_URL}GetSeatLayout");
      print('json --->'  +  json.encode({"CategoryID": cat_id, "CinemaScheduleID" : c_s_id, "ShowType" : show_type}));

      final res =  await http.post("${BASE_URL}GetSeatLayout",
          body: json.encode({"CategoryID": cat_id, "CinemaScheduleID" : c_s_id, "ShowType" : show_type}),
          headers: HEADERS
      );


      if(res.statusCode == 200){



        GetSeatLayout d = GetSeatLayout.fromJson(json.decode(res.body));


        if(int.parse(d.Row)== int.parse(d.Column)){
          int total = d.seatLayouts.length * 2;

          mData = await processData(d,total);
          setState(() {});
        }

      }

    }catch(err){
      print(err);
    }


  }


  Future<List<dynamic>> processData(GetSeatLayout d,int total) async {

    List<dynamic> mData = new List();


    int c = 0;
    for (int i = 0; i < total; i++) {

      // for odd 1,3,5..
      if(i % 2 == 1){
//        d['SeatLayouts'][c]['column_no'] = d['Column'];
//        d['SeatLayouts'][c]['row_no'] = d['Row'];

        d.seatLayouts[c].col_no = int.parse(d.Column);
        d.seatLayouts[c].row_no = int.parse(d.Row);

        //int k = 0;
        for (SeatLayouts seat_l in d.seatLayouts) {
          for (int j = 0; j < seat_l.seats.length; j++) {
            //var seat = seat_l['Seats'][j];

            int col = int.parse(d.Column);

            int row = (j / col).toInt();
            seat_l.seats[j].row_number = row;
          }
          //++k;
        }
        mData.add(d.seatLayouts[c]);
        ++c;
      }
      // for even 0,2,4,6
      else {
        mData.add(d.seatTypes[c]);
      }
    }

    return mData;
  }


  @override
  void initState() {
    super.initState();
    mS_s = List();
    d_l = List();
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
      ),
      bottomNavigationBar: FlatButton(onPressed: (){

        if(mS_s.length > 0){
          Navigator.push(context, MaterialPageRoute(builder: (c){
            return StartBooking();
          }));
        }else {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("Please select some seats"),
          ));
        }
      }, child: Text('Confirm your seats'))
    );
  }

  Widget BuildSeatLayout(int i, BuildContext context) {


    if (i % 2 == 0){
      return Container(
//        color: Colors.yellow,
        height: 30, child: Center(child: Text('${mData[i].Type} : \$${mData[i].Price}'),),);
    } else {


//      Expanded(
//              child: GridView.builder(
//                  itemCount: 20,
//                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
//            itemBuilder: (context, i){
//                    return Text('hell');
//                  })
//            );

      int row_no = mData[i].row_no - 1;
      int col_no = mData[i].col_no - 1;
      List<Seats> seatList = mData[i].seats;



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
                      itemCount: mData[i].seats.length,
//gridDelegate: SilverGrid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                      itemBuilder: (context, j){
                        var s = SeatStatus(seatList[j].Status);
                        return SizedBox.fromSize(
                          size: Size(20, 20),
                          child:
                            Opacity(opacity: s.opacity,
                                child:
                                InkWell(
                                  child: Card(
                                      color: s.color,
//                              color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0))),
                                      child: Center(child: Text(seatList[j].SeatName, style: s.textStyle,))),
                                  onTap: () async{
                                    await onSeatSelect(mData,i,j);
                                    setState(() {

                                    });
                                  },
                                )
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



  Future<void> onSeatSelect(List<dynamic> mData,int k, int j) async {

    Seats seat = mData[k].seats[j];

    int rowNumber = seat.row_number;
    String currency = '\$';
    //globalAreaCode = "";


    if (Qty == 0) {

      if(mS_s.length > 0){

        for (var v in d_l) {
          var rowList = mData[v.row];
          Seats seat1 = rowList.seats[v.col];
          seat1.Status = 1;
        }
        d_l.clear();
      }
      mS_s.clear();

      Qty = initQty;
      total_price = 0.0;

    }


    int leftQty = Qty;

    int five = 0;


    if (Qty > 0) {
      // Qty
      for (int i = 0; i < Qty; i++) {


        if (j != -1) {

          // check the list is at the end or not because at the end it gives the null value

          var rowList = mData[k];

          if (rowList.seats.length > j) {
            Seats seat1 = rowList.seats[j];

            // on the same row
            if (seat1.row_number == rowNumber) {

              // check the next seat is available or not
              if (seat1.Status == 1) {

                if(five < 5){
                  // prevent the duplication
                  if (!mS_s.contains(seat1)) {
                    // change the button text
                    if (seat1.Price != null) {
                      total_price += seat1.Price;
                    }
                    seat1.Status = 3;

                    mS_s.add(seat1);
                    d_l.add(DeselectSeat(row: k, col: j));

                    --leftQty;

                  } else break;
                  ++five;
                } else break;
              } else break;
            } else break;
          } else break;
        } else break;
        ++j;
      }

      Qty = leftQty;

      //tv_number_of_seats.setText(String.valueOf(mSeatList.size()) + "/" + String.valueOf(initQty));
      //changeButtonText(currency);

//      if (leftQty == 0) {
//        changeBtnState();
//
//
//      } else {
//
//        //disableButton();
//      }

    }
  }
}


class SeatStatus {
  var color;
  var textStyle;
  var opacity;

  SeatStatus(s){
    switch(s){
      case 1:
        this.color = Colors.black12;
        this.textStyle = TextStyle(color: Colors.white);
        this.opacity = 1.0;
        break;
      case 2:
        this.color = Colors.grey;
        this.textStyle = TextStyle(color: Colors.white);
        this.opacity = 1.0;
        break;
      case 3:
        this.color = Color(0xff90FBDC);
        this.textStyle = TextStyle(color: Colors.black);
        this.opacity = 1.0;

        break;
      case 0:
      default:
        this.color = Colors.black12;
        this.textStyle = TextStyle(color: Colors.white);
        this.opacity = 0.0;
        break;

    }
  }

}

class DeselectSeat {
  int row;
  int col;

  DeselectSeat({this.row, this.col});
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
