import 'package:cinema_booking_app/app_models.dart';
import 'package:cinema_booking_app/movie_details.dart';
import 'package:cinema_booking_app/seat_select.dart';
import 'package:cinema_booking_app/start_booking.dart';
import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Booking App",
      theme: ThemeData.dark(),
      home: StartBooking(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    movieData = List();
    _fetchMovieData();
  }

  @override
  Widget build(BuildContext context) {


    //print(movieData);


    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinemator'),
      ),
      body: movieData != null ?  mainBody(context, h, w, movieData) : Container(),
    );
  }

  Widget mainBody(BuildContext context, double h, double w, movieData) {
    return ListView.builder(
        itemCount: movieData.length,
        itemBuilder: (context, i) {
          return Container(
            height: h * 0.445,
//            color: i % 2 == 0 ? Colors.green : Colors.blue,
            child: _h_list_body(context, h, w, i),
          );
        });
  }

  Widget _h_list_body(BuildContext c, double h, double w, int i) {

    HomeDataList cat_packet = movieData[i];

    return Container(
      height: h * 0.40,
//      color: i % 2 == 0 ? Colors.yellow : Colors.blue,
      child: Container(
        color: i % 2 == 0 ? Colors.black54 : Colors.black12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(left: 16.0,top: 8.0, bottom: 8.0),
              child: Text(cat_packet.Title ,style: TextStyle(fontSize: 18.0))
            ),
            Container(
//              color: Colors.green,
              height: h * 0.38,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cat_packet.movies.length,
                  itemBuilder: (c, i) {
                    return h_list_item(c, h, w, i, cat_packet);
                  }),
            )

          ],
        ),


      )
    );
  }

  Widget h_list_item(BuildContext c, double h, double w, h_i,HomeDataList cat_packet) {

    Movie movie_packet = cat_packet.movies[h_i];



    return Container(

      width: w * 0.2,
      height: h * 0.3,

      child: Padding(
          padding: EdgeInsets.fromLTRB(4.0,8.0,4.0,8.0),
          child: InkWell(
            onTap: (){
              Navigator.push(c, MaterialPageRoute(builder: (c){
                return MovieDetail(id: movie_packet.ID, cat_id: cat_packet.CategoryID);
              }));
            },
            child: Column(
              children: <Widget>[

                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(

                      width: w * 0.2,
                      height: h * 0.27,
                      decoration: BoxDecoration(

                          image: DecorationImage(
                              image: NetworkImage(movie_packet.Image),
                              fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0))
                      )
                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 8.0),),
                Text(movie_packet.Name, textAlign: TextAlign.center)
              ],
            ),
          )
          ,
      )
    );
  }


  List<HomeDataList> movieData;

//  API Calling
  void _fetchMovieData() async {
      print('${BASE_URL}GetAllShow/');
      const url = "${BASE_URL}GetAllShow/";

      var res = await http.post(url,body: json.encode({"CountryID": 1}));




      if (res.statusCode == 200){
        final d = json.decode(res.body);


        HomeResponse mHome = HomeResponse.fromJson(d);
        print(mHome);
        if(mHome.Status){
          setState(() {
            movieData = mHome.movieList;
          });
        }
      }
  }


}



class Dummy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: Colors.green,
        height: h * 0.8,
        child: ListView.builder(itemBuilder: (context,i){
          return SizedBox(

            width: 10,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(child: Text('helloa'),color: Colors.blue,),
              ],
            )
          );
        })
      ),
    );
  }
}
