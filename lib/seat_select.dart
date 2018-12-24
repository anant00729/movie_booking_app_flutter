import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class SeatSelect extends StatefulWidget {
  @override
  _SeatSelectState createState() => _SeatSelectState();
}

class _SeatSelectState extends State<SeatSelect> {


  void _fetchSeatLayoutData() async {
    final res = await http.get('${BASE_URL}Programming/GetMovieByID?ScheduleTimeID=186&CinemaScheduleID=188&CategoryID=4&Type=Public');
    if(res.statusCode == 200){
      final data = json.decode(res.body);

      print(data);
    }
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
      body: Column(
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
          Expanded(
            child: MediaQuery(
              data: MediaQuery.of(context).removePadding(
                  removeTop: true),
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                  itemBuilder: (context, i){
                      return Text('hello all');
                  })
            )


          )

        ],
      )
    );
  }
}

//http://gogophp.binarynumbers.io/api/Booking/GetSeatLayout?ScheduleTimeID=186&CinemaScheduleID=188&CategoryID=4&Type=Public
