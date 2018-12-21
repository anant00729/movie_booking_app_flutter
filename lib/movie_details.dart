import 'package:flutter/material.dart';


class MovieDetail extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(


      body:
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
                           Text('Movie Name', textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0),),
                           Padding(padding: EdgeInsets.all(2.0),),
                           Text('English | 120 min | 2018 | 7.6', textAlign: TextAlign.center,)
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
                       image: NetworkImage('http://gogophp.binarynumbers.io/assets/movies/thumb/ralphbreaks_thumbnail.jpg'),
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
                                       Text('Pick Cinema', style: TextStyle(fontSize: 16.0),),
                                       Icon(Icons.arrow_drop_down)
                                     ],),
                                   onTap: (){
                                     print('hello');
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
                                   Text('Pick Date', style: TextStyle(fontSize: 16.0),),
                                   Icon(Icons.calendar_today)
                                 ],),
                               onTap: (){
                                 print('hello');
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
                             itemCount: 10,
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
                                         image: DecorationImage(image: NetworkImage('http://gogophp.binarynumbers.io/assets/movies/thumb/ralphbreaks_thumbnail.jpg'),fit : BoxFit.cover),
                                         borderRadius: BorderRadius.circular(8.0)
                                     ),

                                   ),
                                 ),
                               );
                             }),


                       ),
                       Divider(),
                       Text('6.7', style: TextStyle(color: Color(0xFF099fd5),fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Text('IMDB'),
                       Padding(padding: const EdgeInsets.all(8.0)),
                       Text('Storyline', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Padding(padding: const EdgeInsets.all(8.0)),
                       Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ", style: TextStyle(fontSize: 14.0)),
                       Divider(),
                       Text('Cast', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                       Padding(padding: EdgeInsets.all(8.0),),
                       Container(
                         height: 280,
                         child: MediaQuery(
                             data: MediaQuery.of(context).removePadding(
                               removeTop: true),
                             child: ListView.builder(
                             itemCount: 10,
                             itemBuilder: (context, index){
                               return Container(
//                                 color: Colors.green,
                                 child: ListTile(
                                   leading: CircleAvatar(
                                     radius: 24.0,
                                     backgroundColor: Colors.grey,
                                     backgroundImage: NetworkImage('http://gogophp.binarynumbers.io/assets/movies/thumb/ralphbreaks_thumbnail.jpg'),

                                   ),
                                   contentPadding: const EdgeInsets.all(0.0),
                                   title: Text('hello all'),
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
       )


      );
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
