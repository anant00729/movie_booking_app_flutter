import 'package:cinema_booking_app/app_models.dart';
import 'package:cinema_booking_app/pick_date.dart';
import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PickCinema extends StatefulWidget {

  final id;
  final cat_id;
  PickCinema({Key key, this.id, this.cat_id}) : super(key : key);


  @override
  _PickCinemaState createState() => _PickCinemaState();
}

class _PickCinemaState extends State<PickCinema> {

  var c_list;

  void _fetchCinemaList() async {

    final movieId = widget.id;
    final res =  await http.post("${BASE_URL}GetCinemaList/",
        body: json.encode({"MovieID": "${movieId}"}),
        headers: HEADERS
    );

    final d = json.decode(res.body);
    CinemaList mCinemaList = CinemaList.fromJson(d);

    print(mCinemaList);

    if(res.statusCode == 200){
      setState(() {
        c_list = MovieDetails.fromJson(d);
      });
    }


  }

  @override
  void initState() {
    super.initState();
    _fetchCinemaList();
  }
  var s_cinema;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Cinema'),
      ),
      body: c_list == null ? Center(child: CircularProgressIndicator(),) :
      ListView.builder(
          itemCount: c_list.length,
          itemBuilder: (context, i){
            return Column(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    child: ListTile(
                      title: Text(c_list[i]['CinemaName']),
                      subtitle: Text(c_list[i]['Address']),
                    ),
                    onTap: () async{
                      s_cinema = c_list[i];
                      final results = await Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PickDate(id: widget.id,cat_id : widget.cat_id, c_id : c_list[i]['CinemaID']);
                      }));
                      if (results != null && results.containsKey('s_date')) {

                        Navigator.of(context).pop({'s_date':results['s_date'], 's_cinema' : s_cinema});
                      }
                    },
                  )
                ),
                Divider()
              ]
            );
          })
    );
  }



}
