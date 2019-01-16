import 'package:cinema_booking_app/app_models.dart';
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

  List<DateTimeModel> mDateList;
  List<TimeModel> mTimeList;
  var _loading = true;

  void _fetchDateList() async {


    final movieId = widget.id;
    final cinemaId = widget.c_id;
    final cat_id = widget.cat_id;
    final res =  await http.post("${BASE_URL}GetShowDate/",
        body: json.encode({"MovieID": movieId, "CinemaID" : cinemaId,"CountryID": 1, "CategoryID": cat_id}),
        headers: HEADERS
    );

    final d = json.decode(res.body);
    CinemaList mDateListData = CinemaList.fromJson(d);

    print(mDateListData);

    if(res.statusCode == 200 && mDateListData.Status){
      print(mDateListData);

      if(mDateListData.cinema.length > 0) {
        mDateList.clear();
        for (var data in mDateListData.cinema){
          final date = data.SchTDate.split('-');
          DateTimeModel da = new DateTimeModel(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),data.CinemaScheduleID);
          mDateList.add(da);
        }

        this._dateTime = DateTime(mDateList[0].year,mDateList[0].month,mDateList[0].date);
        _selectDate(context);
      }

    }



//    print('${BASE_URL}Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
//    final res = await http.get('${BASE_URL}Programming/GetDateList?MovieID=${widget.id}&CategoryID=${widget.cat_id}&CinemaID=${widget.c_id}');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//
//
//
//      if(d.length > 0) {
//        mDateList.clear();
//        for (var data in d){
//          final date = data['SchTDate'].split('-');
//          DateTimeModel da = new DateTimeModel(int.parse(date[0]), int.parse(date[1]), int.parse(date[2]),data['CinemaScheduleID']);
//          mDateList.add(da);
//        }
//        _selectDate(context);
//      }
//    }
  }

  var display_date = "";

  void _fetchTimeList(mDate, String week_day, String m_n) async {
    setState(() {
      _loading = true;
    });
    var c_s_id = mDate.c_s_id;
    final movieId = widget.id;
    final cinemaId = widget.c_id;
    final res =  await http.post("${BASE_URL}GetShowTime/",
        body: json.encode({"MovieID": movieId, "CinemaID" : cinemaId, "CinemaScheduleID" : c_s_id}),
        headers: HEADERS
    );

    final d = json.decode(res.body);
    CinemaList mTimeData = CinemaList.fromJson(d);

    print(mTimeData);

    if(res.statusCode == 200 && mTimeData.Status){

      mTimeList.clear();
      for (var d in mTimeData.cinema) {
        var t = TimeModel(d.CinemaScheduleID, d.CinemaTimings, d.Format);
        mTimeList.add(t);
      }
      // 23 December, 2018 | Sunday
      display_date = "${mDate.date} $m_n, ${mDate.year} | $week_day";
      setState(() {
        _loading = false;
      });



      print(mTimeData);
    }




//    print('${BASE_URL}/Programming/GetSchTime?CinemaScheduleID=${c_s_id}&CategoryID=${widget.c_id}');
//    final res = await http.get('${BASE_URL}/Programming/GetSchTime?CinemaScheduleID=${c_s_id}&CategoryID=${widget.c_id}');
//    if (res.statusCode == 200){
//      final d = json.decode(res.body);
//      if(d.length > 0) {
//        print(d);
//        mTimeList.clear();
//        for (var _d in d) {
//          var t = TimeModel(_d['ScheduleTimeID'], _d['CinemaTimings'], _d['Format']);
//          mTimeList.add(t);
//        }
//        // 23 December, 2018 | Sunday
//        display_date = "${mDate.date} $m_n, ${mDate.year} | $week_day";
//        setState(() {
//          _loading = false;
//        });
//
//      }
//    }
  }


  DateTimeModel mDate;

  Future<Null> _selectDate(BuildContext c) async {
    if(mDateList.length > 0){
      final l_i = mDateList.length - 1;

      final DateTime picked = await showDatePicker(
          context: c,
          initialDate: _dateTime,
          firstDate:  DateTime(mDateList[0].year,mDateList[0].month,mDateList[0].date),
          lastDate: l_i != 0 ? DateTime(mDateList[l_i].year,mDateList[l_i].month,mDateList[l_i].date) : DateTime(mDateList[l_i].year,mDateList[l_i].month,mDateList[l_i].date+1)
      );

      if(picked != null && picked != _dateTime){
        _dateTime = picked;

        mDate = mDateList.firstWhere((l){ return (l.month == picked.month && l.year == picked.year && l.date == picked.day);});


        _fetchTimeList(mDate,WEEK_DAYS[picked.weekday-1], MONTH_NAME[picked.month-1]);


      }
    }
  }


  @override
  void initState() {
    super.initState();
    mDateList = List();
    mTimeList = List();
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
                          child: Text(display_date),
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
              (!_loading && mTimeList != null ?
              Expanded(
                child: ListView.builder(
                    itemCount: mTimeList.length,
                    itemBuilder: (context,i){
                      var t = mTimeList[i];
                      return Column(
                        children: <Widget>[
                          Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              child: ListTile(
                                  leading:
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20.0,4.0,20.0,4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[

                                        Text('${t.t_eng} | ${t.format}' , style: TextStyle(fontSize: 18)),
                                        RichText(
                                          text: TextSpan(

                                              style: DefaultTextStyle.of(context).style,
                                              children : [
                                                TextSpan(
                                                    text: t.c_t_dis,
                                                    style: TextStyle(fontSize: 28)
                                                ),
                                                TextSpan(
                                                    text: " ${t.t_format}",
                                                    style: TextStyle(fontSize: 12)
                                                )
                                              ]
                                          ),
                                        ),
                                      ],
                                    ),

                                  )

                              ),
                              onTap: (){
                                Navigator.of(context).pop(
                                    {
                                      's_date':
                                    '${MONTH_NAME[_dateTime.month-1]} ${_dateTime.day}, ${_dateTime.year} (${t.c_t_dis} ${t.t_format})',
                                      'c_s_id':
                                      t.s_t_id
                                    });
                              },
                            ),
                          ),
                          Divider()
                        ],
                      );
                    }),
              ): Center(child: CircularProgressIndicator()))
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
    var _dateTime = new DateTime(year,month,date);
    print(_dateTime);
    this.year = year;
    this.month = month;
    this.date = date;
    this.c_s_id = c_s_id;
  }
}

class TimeModel{
  var s_t_id;
  var c_t;
  var c_t_dis;
  var format;
  var t_format;
  var t_eng;


  TimeModel(s_t_id,c_t,format){
    var t = c_t.split(':');


    var t_hr;
    if(int.parse(t[0]) > 12){
      t_hr = int.parse(t[0]) - 12;
    }else if(int.parse(t[0]) == 0){
      t_hr = 12;
    }else {
      t_hr = int.parse(t[0]);
    }
    this.c_t_dis = '$t_hr:${t[1]}';


    var _timeOfDay = TimeOfDay(hour: int.parse(t[0]), minute: int.parse(t[1]));

    if (_timeOfDay.hour < 12) {
      this.t_format = "AM";
      this.t_eng = "Morning";
    }
    if (_timeOfDay.hour >= 12 && _timeOfDay.hour <= 16) {
      this.t_format = "PM";
      this.t_eng = "Noon";
    }
    if (_timeOfDay.hour >= 16) {
      this.t_format = "PM";
      this.t_eng = "Evening";
    }

    this.s_t_id = s_t_id;
    this.c_t = c_t;
    this.format = format;
  }

}


