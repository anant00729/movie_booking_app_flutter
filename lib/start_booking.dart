import 'package:flutter/material.dart';


class StartBooking extends StatefulWidget {
  @override
  _StartBookingState createState() => _StartBookingState();
}

class _StartBookingState extends State<StartBooking> {
  @override
  Widget build(BuildContext context) {

    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;


    return Scaffold(
      body : Container(
        width: w,
        height: h,
        padding: const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 32),
        child: Container(
          color: Colors.pink,
          child: Card(
              child: Container(
                color: Colors.pinkAccent,
                //child: Text('sadsd'),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Container(

                    color: Colors.yellowAccent,
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        splashColor: Colors.grey,
                        child: Container(
                        color: Colors.purple,
                          height: h * 0.10,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
                            child: Icon(Icons.arrow_back, size: 28.0,),
                          ),
                        ),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
//                Container(
//                  color: Colors.yellow,
//                  width: 50,
//                  height: 50,
//                  child: Material(
//                    type: MaterialType.transparency,
//                    child: InkWell(
//                      splashColor: Colors.grey,
//                      child: Container(
//                        height: 50,
//                        child: Icon(Icons.arrow_back, size: 28.0)
//                      ),
//                    ),
//                  ),
//                )
//
//
                  Container(

                    padding: const EdgeInsets.only(left: 20),
                    color: Colors.green,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: w * 0.26,
                          height: h * 0.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage('http://gogocinema.binarynumbers.io/assets/images/movies/AppImage/5c260a3b85fe1.jpg'),
                                fit : BoxFit.cover,

                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                          ),
                        ),
                        Padding(padding: const EdgeInsets.all(2.0)),
                        Container(
                          padding: const EdgeInsets.all(6.0),
                          width: w * 0.54,
                          height: h * 0.25,
                          color: Colors.yellow,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('Bumblebee', style: TextStyle(color: Colors.black , fontSize: 24),),
                              Padding(padding: const EdgeInsets.all(2.0),),
                              Text('Cinema 2' , style: TextStyle(color: Color(0xFF099fd5), fontSize: 16)),
                              Padding(padding: const EdgeInsets.all(2.0),),
                              Text('17 January, 2019 (Thrusday)\nNoon | 2D | 01:00 PM' ,style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                //17 January, 2019 (Thrusday)\nNoon | 2D | 01:00 PM


                  ],
                ),
              )



          ),
        ),
      )
    );
  }
}
