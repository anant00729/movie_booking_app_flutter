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


  var _date_list;
  List<DateTimeModel> mDateList;

  void _fetchDateList() async {
    print('${BASE_URL}/Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
    final res = await http.get('${BASE_URL}/Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
    if (res.statusCode == 200){
      final d = json.decode(res.body);



      if(d.length > 0) {
        var firstDate = d[0]['SchTDate'].split('-');
        var lastDate = d[d.length - 1]['SchTDate'].split('-');

        mDateList = List();
        mDateList.add(DateTimeModel(int.parse(firstDate[0]), int.parse(firstDate[1]), int.parse(firstDate[2])));
        mDateList.add(DateTimeModel(int.parse(lastDate[0]), int.parse(lastDate[1]), int.parse(lastDate[2])));

        _date_list = d;
      }


    }
  }




  Future<Null> _selectDate(BuildContext c) async {
    if(mDateList.length == 2){
      final DateTime picked = await showDatePicker(
          context: c,
          initialDate: _dateTime,
          firstDate: DateTime(mDateList[0].year,mDateList[0].month,mDateList[0].date),
          lastDate: DateTime(mDateList[1].year,mDateList[1].month,mDateList[1].date)
      );

      if(picked != null && picked != _dateTime){
        print('hello all ${_dateTime.toString()}');
      }
    }
  }


  @override
  void initState() {
    super.initState();
    _fetchDateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick date and time')),
      body: Center(
        child: InkWell(
          child: Text('hello all'),
          onTap: (){
            if (mDateList != null){
              _selectDate(context);
            }
          },
        ),
      ),
    );
  }
}

class DateTimeModel{
  var year;
  var month;
  var date;
  DateTimeModel(year, month , date){
    this.year = year;
    this.month = month;
    this.date = date;
  }
}


