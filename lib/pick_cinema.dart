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
    print('${BASE_URL}/Programming/GetCinema?MovieID=${widget.id}&CategoryID=${widget.cat_id}');
    final res = await http.get('${BASE_URL}/Programming/GetCinema?MovieID=${widget.id}&CategoryID=${widget.cat_id}');
    if (res.statusCode == 200){
      final d = json.decode(res.body);
      print(d);

      setState(() {
        c_list = d;
      });

    }
  }

  @override
  void initState() {
    super.initState();
    _fetchCinemaList();
  }

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
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PickDate(id: widget.id,cat_id : widget.cat_id, c_id : c_list[i]['CinemaID']);
                      }));
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
