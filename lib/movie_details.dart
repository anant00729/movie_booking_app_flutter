import 'package:cinema_booking_app/app_models.dart';
import 'package:cinema_booking_app/pick_cinema.dart';
import 'package:cinema_booking_app/seat_select.dart';
import 'package:cinema_booking_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieDetail extends StatefulWidget {

  final id;
  final cat_id;
  MovieDetail({Key key, this.id, this.cat_id}) : super(key : key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  MovieDetails _movie_d;
  var p_cinema;
  var p_date;
  var c_s_id;
  
  void _fetchMovieDetails() async {

    final movieId = widget.id;

    final res =  await http.post("${BASE_URL}GetMovieDetails",
        body: json.encode({"MovieID": "${movieId}"}),
        headers: HEADERS
    );

    final d = json.decode(res.body);
    MovieDetails mMovieD = MovieDetails.fromJson(d);
    if(res.statusCode == 200){
      setState(() {
        _movie_d = MovieDetails.fromJson(d);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    p_cinema = "Pick Cinema";
    p_date = "Pick Date";
    _fetchMovieDetails();

  }

  
  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    List<Actors> actors;
    List<Trailers> trailers;

    if(_movie_d != null){
      actors = _movie_d.actors;
      trailers = _movie_d.trailers;
    }

    return


      Scaffold(
      body: _movie_d != null ?

       SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Container(
                 width: w,
                 height: h * 0.4,
//        color: Colors.yellow,
                 child: Stack(
                   fit: StackFit.loose,
                   children: <Widget>[

                     Container(
                         width: w,
                         height: h * 0.4,
                         color: const Color(0xFF8f000000)
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

                     Positioned(child:
                     Container(
                       width: w,
                       child: Column(
                         children: <Widget>[
                           Text(_movie_d.Name != null ? _movie_d.Name : '', textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0),),
                           Padding(padding: EdgeInsets.all(2.0),),
                           Text('${_movie_d.Lang} | ${_movie_d.Time} | ${_movie_d.Year} | ${_movie_d.IMDBRating}', textAlign: TextAlign.center,)
                         ],
                       )
                       ,
//              color: Colors.purple,
                     ),
                       bottom: 16,
                     )
                   ],
                 ),

                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: NetworkImage(_movie_d.HeaderImage != null ?  _movie_d.HeaderImage : ''),
                       fit: BoxFit.cover
                   ),
                 )

             ),
             Padding(padding: const EdgeInsets.all(6.0),),
             Container(
               padding: const EdgeInsets.all(16.0),
//            color: Colors.yellow,
               child: Card(
                 child: Container(
                   padding: const EdgeInsets.all(16.0),
                   child: Column(
                     children: <Widget>[
                       Container(
                           decoration: BoxDecoration(
                               color: Colors.grey,
                               borderRadius: BorderRadius.circular(16.0)
                           ),
                           width: w * 0.8,
                           height: h * 0.1,
                           padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                           child:
                               Material(
                                 type: MaterialType.transparency,
                                 child: InkWell(
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     mainAxisSize: MainAxisSize.max,
                                     children: <Widget>[
                                       Text(p_cinema, style: TextStyle(fontSize: 16.0),),
                                       Icon(Icons.arrow_drop_down)
                                     ],),
                                   onTap: (){
                                     sendToPickCinemaPage(context);
                                   },
                                 ),
                               )
                       ),
                       Padding(padding: const EdgeInsets.all(4.0),),
                       Container(
                         decoration: BoxDecoration(
                             color: Colors.grey,
                             borderRadius: BorderRadius.circular(16.0)
                         ),
                         width: w * 0.8,
                         height: h * 0.1,
                         padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                           child:
                           Material(
                             type: MaterialType.transparency,
                             child: InkWell(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 mainAxisSize: MainAxisSize.max,
                                 children: <Widget>[
                                   Text(p_date, style: TextStyle(fontSize: 16.0),),
                                   Icon(Icons.calendar_today)
                                 ],),
                               onTap: (){
                                 sendToPickCinemaPage(context);
                               },
                             ),
                           )
//                    color: Colors.green,
                       )
                     ],
                   ),
                 ),
               ),
             ),


             Container(
               padding: const EdgeInsets.all(16.0),
//            color: Colors.yellow,
               child: Card(
                 child: Container(
//                   color: Colors.yellow,
                   padding: const EdgeInsets.all(16.0),
                   child:

                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     mainAxisSize: MainAxisSize.max,
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                     children: <Widget>[
                       Text('Trailer & Clips', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Padding(padding: const EdgeInsets.all(4.0),),
                       Container(
                         width: w * 0.8,
                         height: h * 0.19,
                         child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemCount: trailers.length,
                             itemBuilder: (context, i){
                               return
                               Padding(
                                 padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                                 child: Material(
                                   borderRadius: BorderRadius.circular(8.0),
                                   elevation: 3,
                                   child: Container(
                                     width: w * 0.38,
                                     height: h * 0.19,
                                     decoration: BoxDecoration(
                                         image: DecorationImage(image: NetworkImage("https://img.youtube.com/vi/${trailers[i].URI}/mqdefault.jpg"),fit : BoxFit.cover),
                                         borderRadius: BorderRadius.circular(8.0)
                                     ),

                                   ),
                                 ),
                               );
                             }),


                       ),
                       Divider(),
                       Text(_movie_d.IMDBRating, style: TextStyle(color: Color(0xFF099fd5),fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Text('IMDB'),
                       Padding(padding: const EdgeInsets.all(8.0)),
                       Text('Storyline', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Padding(padding: const EdgeInsets.all(8.0)),
                       Text(_movie_d.StoryLine, style: TextStyle(fontSize: 14.0)),
                       Divider(),
                       Text('Cast', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Padding(padding: EdgeInsets.all(8.0),),
                       Container(
                         height: 280,
                         child: MediaQuery(
                             data: MediaQuery.of(context).removePadding(
                               removeTop: true),
                             child: ListView.builder(
                             itemCount: actors.length,
                             itemBuilder: (context, index){
                               return Container(
//                                 color: Colors.green,
                                 child: ListTile(
                                   leading: CircleAvatar(
                                     radius: 24.0,
                                     backgroundColor: Colors.grey,
                                     backgroundImage: NetworkImage(actors[index].Image),

                                   ),
                                   contentPadding: const EdgeInsets.all(0.0),
                                   title: Text(actors[index].Name),
                                 ),
                               );
                             })
                         )

                         ,
                       )

//                       ListView.builder(
//                         itemCount: 10,
//                         itemBuilder: (context, i){
////                           return ListTile(
////                             leading: CircleAvatar(
////                               backgroundColor: Colors.blueGrey,
////                               backgroundImage: NetworkImage('http://gogophp.binarynumbers.io/assets/movies/thumb/ralphbreaks_thumbnail.jpg'),
////                             ),
////                           );
//                         return Text('Hello all');
//                         })

                     ],
                   ),
                 ),
               ),
             )




           ],
         )
         ,
       ) : Center(child: CircularProgressIndicator(),),

          bottomNavigationBar:
          p_cinema != "Pick Cinema" ? FlatButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c){

              //{"CategoryID": 1, "CinemaScheduleID" : 1243, "ShowType" : ""}
              final cat_id = widget.cat_id;
              final c_s_id = this.c_s_id;
              final show_type = "";
              return SeatSelect(cat_id: cat_id, c_s_id: c_s_id, show_type: show_type,);
            }));
          }, child: Text('Pick your seats')) : null
      );

  }





  void sendToPickCinemaPage(BuildContext c) async {
    final results = await Navigator.push(c, MaterialPageRoute(builder: (c){
      return PickCinema(id: widget.id,cat_id: widget.cat_id);
    }));
    if (results != null && results.containsKey('s_date') && results.containsKey('s_cinema')) {
      setState(() {
        p_cinema = results['s_cinema'].CinemaName;
        p_date = results['s_date'];
        c_s_id = results['c_s_id'];
      });
    }
  }
}


//Column(
//children: <Widget>[
//Container(
//height: h * 0.4,
//decoration: BoxDecoration(
//image: DecorationImage(
//image: NetworkImage('http://gogophp.binarynumbers.io/assets/movies/thumb/ralphbreaks_thumbnail.jpg'),
//fit: BoxFit.cover
//
//),
//
////image: NetworkImage(''),
//)
//),
//Text('Hello '),
//
//],
//),
