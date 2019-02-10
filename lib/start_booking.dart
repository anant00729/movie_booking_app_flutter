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
        body: Container(
      width: w,
      height: h,

      child: Container(

//          color: Colors.pink,
        child: SingleChildScrollView(

          child: Card(
              margin: const EdgeInsets.only(right: 14, left: 14, top: 32, bottom: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
//            color: Colors.pinkAccent,
            //child: Text('sadsd'),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
//                  color: Colors.yellowAccent,
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      splashColor: Colors.grey,
                      child: Container(
//                        color: Colors.purple,
                        height: h * 0.10,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(22, 20, 22, 20),
                          child: Icon(
                            Icons.arrow_back,
                            size: 28.0,
                          ),
                        ),
                      ),
                      onTap: () {
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
//                  color: Colors.green,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: w * 0.26,
                        height: h * 0.25,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'http://gogocinema.binarynumbers.io/assets/images/movies/AppImage/5c260a3b85fe1.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      ),
                      Padding(padding: const EdgeInsets.all(2.0)),
                      Container(
                        padding: const EdgeInsets.only(right: 6.0,left: 6.0,bottom: 6.0),
                        width: w * 0.54,
                        height: h * 0.25,
//                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'Bumblebee',
                              style: TextStyle(fontSize: 24),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                            ),
                            Text('Cinema 2',
                                style: TextStyle(
                                    color: Color(0xFF099fd5), fontSize: 16)),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                            ),
                            Text(
                                '17 January, 2019 (Thrusday)\nNoon | 2D | 01:00 PM',
                                style:
                                    TextStyle(fontSize: 14)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                //17 January, 2019 (Thrusday)\nNoon | 2D | 01:00 PM

                Container(
//                  color: Colors.yellow,
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
//                        color: Colors.green,
                        child: Column(
                          children: <Widget>[
                            Text('Tickets Booked',
                                style: TextStyle(fontSize: 16.0)),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                            ),
                            Text('1', style: TextStyle(fontSize: 20.0))
                          ],
                        ),
                      ),
                      Container(
                        height: 55.0,
                        color: Colors.white,
                        width: 1,
                      ),
                      Container(
//                        color: Colors.pink,
                        child: Column(
                          children: <Widget>[
                            Text('Amt. Payable',
                                style: TextStyle(fontSize: 16.0)),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                            ),
                            Text('\$1', style: TextStyle(fontSize: 20.0)),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                            ),
                            Text('(Amount inclusive of all taxes)',
                                style: TextStyle(fontSize: 8.5))
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Padding(padding: const EdgeInsets.all(6.0),),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('───'),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                          child: Container(
                        padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),
                        child:
                            Text('PROMO CODE', style: TextStyle(fontSize: 10.0)),
                      )),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Text('───'),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(6.0),),
                Container(
                  padding: const EdgeInsets.only(left: 18, right: 18),
//                  color: Colors.deepPurpleAccent,
                  height: 55,
                  child: Form(
                    child: MediaQuery(
                      data: MediaQuery.of(context).removePadding(removeTop: true),
                      child: ListView(
                      children: <Widget>[
                        TextField(

                          style: TextStyle(fontSize: 16.0),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(16.0),
                              labelStyle: TextStyle(

                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                      ],
                  ),
                    )),
                ),
                Padding(padding: const EdgeInsets.all(4.0)),
                Center(child: Text('Apply promo code to avail special discounts.' , style: TextStyle(fontSize: 12.0),)),
                Padding(padding: const EdgeInsets.all(6.0),),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('───'),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20.0)),
                            child:
                            Text('YOUR DETAILS', style: TextStyle(fontSize: 10.0)),
                          )),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Text('───'),
                  ],
                ),
                Padding(padding: const EdgeInsets.all(6.0),),

                Container(
                  padding: const EdgeInsets.only(left: 18, right: 18),
//                  color: Colors.deepPurpleAccent,
                  height: 114,
                  child: Form(
                      child: MediaQuery(
                        data: MediaQuery.of(context).removePadding(removeTop: true),
                        child: ListView(
                          children: <Widget>[
                            TextField(

                              style: TextStyle(fontSize: 16.0),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  labelStyle: TextStyle(

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0))),
                            ),
                            Padding(padding: const EdgeInsets.all(6.0),),
                            TextField(

                              style: TextStyle(fontSize: 16.0),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16.0),
                                  labelStyle: TextStyle(

                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0))),
                            ),

                          ],
                        ),
                      )),

                ),


                Row(
                  children: <Widget>[
                    Padding(padding: const EdgeInsets.all(8.0),),
                    Checkbox(
                      value: false,
                      onChanged: (bool value) {

                      },
                    ),
                    Text('I agree to all the terms and conditions',style: TextStyle(fontSize: 12.0),)
                  ],
                ),



              ],
            ),
          )),
        ),
      ),
    ),

      bottomNavigationBar: FlatButton(onPressed: (){
      },
        child: Text('Confirm your details') ,
      ));




//    bottomNavigationBar:
//    p_cinema != "Pick Cinema" ? FlatButton(onPressed: (){
//      Navigator.push(context, MaterialPageRoute(builder: (c){
//
//        //{"CategoryID": 1, "CinemaScheduleID" : 1243, "ShowType" : ""}
//        final cat_id = widget.cat_id;
//        final c_s_id = this.c_s_id;
//        final show_type = "";
//        return SeatSelect(cat_id: cat_id, c_s_id: c_s_id, show_type: show_type,);
//      }));
//    }, child: Text('Pick your seats')) : null
  }
}
