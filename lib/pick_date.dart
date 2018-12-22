import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PickDate extends StatefulWidget {

  final id;
  final cat_id;
  final c_id;
  PickDate({Key key, this.id, this.cat_id, this.c_id}) : super(key : key);

  @override
  _PickDateState createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> {

  DateTime _dateTime = new DateTime.now();
  TimeOfDay _timeOfDay = new TimeOfDay.now();



  List<DateTimeModel> mDateList;

  void _fetchDateList() async {
    print('${BASE_URL}Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
    final res = await http.get('${BASE_URL}Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
    if (res.statusCode == 200){
      final d = json.decode(res.body);



      if(d.length > 0) {
        mDateList.clear();
        for (var data in d){
          final date = data['SchTDate'].split('-');
          DateTimeModel da = new DateTimeModel(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),data['CinemaScheduleID']);
          mDateList.add(da);
        }
        _fetchTimeList(mDateList[0].c_s_id);
      }
    }
  }

  void _fetchTimeList(c_s_id) async {

    print('${BASE_URL}/Programming/GetSchTime?CinemaScheduleID=${c_s_id}&CategoryID=${widget.c_id}');
    final res = await http.get('${BASE_URL}/Programming/GetSchTime?CinemaScheduleID=${c_s_id}&CategoryID=${widget.c_id}');
    if (res.statusCode == 200){
      final d = json.decode(res.body);
      if(d.length > 0) {
        print(d);



      //    "ScheduleTimeID" -> 325
      //    "CinemaTimings" -> "12:30"
      //    "Format" -> "2D"
      }
    }
  }




  Future<Null> _selectDate(BuildContext c) async {
    if(mDateList.length > 0){
      final l_i = mDateList.length - 1;
      final DateTime picked = await showDatePicker(
          context: c,
          initialDate: _dateTime,
          firstDate: DateTime(mDateList[0].year,mDateList[0].month,mDateList[0].date),
          lastDate: DateTime(mDateList[l_i].year,mDateList[l_i].month,mDateList[l_i].date)
      );

      if(picked != null && picked != _dateTime){
        _dateTime = picked;
        DateTimeModel mDate = mDateList.firstWhere((l){ return (l.month == picked.month && l.year == picked.year && l.date == picked.day);});
        _fetchTimeList(mDate.c_s_id);
      }
    }
  }


  @override
  void initState() {
    super.initState();
    mDateList = List();
    _fetchDateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick date and time')),
      body:
      Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding( padding: EdgeInsets.all(16.0)),
              Container(
                child :Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('───'),
                    Padding( padding: EdgeInsets.all(4.0)),
                    Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Text('22 December, 2018 | Saturday'),
                        ),
                        onTap: (){
                          _selectDate(context);
                        },
                      ),
                    )
                    ,
                    Padding( padding: EdgeInsets.all(4.0)),
                    Text('───'),
                  ],
                ),
              ),

              Padding( padding: EdgeInsets.all(16.0)),
              Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,i){
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading:
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,4.0,20.0,4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Text('Noon | 3D' , style: TextStyle(fontSize: 18)),
                                RichText(
                                  text: TextSpan(

                                      style: DefaultTextStyle.of(context).style,
                                      children : [
                                        TextSpan(
                                            text: "12:30",
                                            style: TextStyle(fontSize: 28)
                                        ),
                                        TextSpan(
                                            text: " PM",
                                            style: TextStyle(fontSize: 12)
                                        )
                                      ]
                                  ),
                                ),
                              ],
                            ),

                            )

                        ),
                        Divider()
                      ],
                    );
                  }),
            )

        ],
      ),
      )

      );
  }
}

class DateTimeModel{
  var year;
  var month;
  var date;
  var c_s_id;
  DateTimeModel(year, month , date, c_s_id){
    this.year = year;
    this.month = month;
    this.date = date;
    this.c_s_id = c_s_id;
  }
}

class TimeModel{

}


