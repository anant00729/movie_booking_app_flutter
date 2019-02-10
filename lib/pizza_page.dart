import 'package:flutter/material.dart';

class PizzaPage extends StatefulWidget {
  @override
  _PizzaPageState createState() => _PizzaPageState();
}

class _PizzaPageState extends State<PizzaPage> {

  final List<Map<String, String>> _m_det_l = [
    {'Movie' : 'Movie Name'},
    {'Cinema' : 'Cinema Something'},
    {'Date' : '05 Feb, 2019'},
    {'Time' : '10:30 AM'}
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.only(right: 14, left: 14, top: 32, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: Colors.grey,
              child: Container(
//                  color: Colors.purple,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.close,
                    size: 28.0,
                  ),
                ),
              ),
              onTap: () {
                //Navigator.of(context).pop();
              },
            ),
          ),

          Center(
              child: Column(
            children: <Widget>[
              Image.network(
                "https://avatars1.githubusercontent.com/u/26194642?s=88&v=4",
                width: 100,
                height: 100,
              ),
              Padding(padding: const EdgeInsets.all(6.0)),
              Text(
                'Good News\nScreen Confirmed',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              )
            ],
          )),



          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110),
                  child: Container(
                      child: Center(child: Text('asdsad')),
                      color: Colors.pink
                  )),
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110),
                  child: Container(
                      child: Center(child: Text('asdasd')),
                      color: Colors.deepPurpleAccent
                  )),
            ],
          ),

//          Flexible(
//            child: ListView.builder(
//                itemCount: _m_det_l.length,
//                itemBuilder: (context, i) {
//
//                  final Map<String, String> o = _m_det_l[i];
//
//
//                  return Row(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      ConstrainedBox(
//                          constraints: BoxConstraints(maxWidth: 110),
//                          child: Container(
//                              child: Center(child: Text()),
//                              color: Colors.pink
//                          )),
//                      ConstrainedBox(
//                          constraints: BoxConstraints(maxWidth: 110),
//                          child: Container(
//                              child: Center(child: Text()),
//                              color: Colors.deepPurpleAccent
//                          )),
//                    ],
//                  );
//                }),
//          ),

//          Center(
//            child: Container(
//              height: 400,
//              width: w,
//              child: ListView.builder(itemBuilder: (context, i){
//                return Row(
//                  mainAxisSize: MainAxisSize.max,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    Container(
//                      color: Colors.deepPurpleAccent,
//                      width: 100,
//                      height: 200 / 4,
//                      child: Center(child: Text('asdjkashdk')),
//                    ),
//                    Container(
//                      color: Colors.purple,
//                      width: 100,
//                      height: 200 / 4,
//                      child: Center(child: Text('asdjkashdk')),
//                    )
//                  ],
//                );
//              }),
//            ),
//          ),

//            Flexible(
//              child: ListView.builder(
//                  itemCount: 4,
//                  itemBuilder: (context, i){
//                    return Text('asdjsakdh');
//                  }),
//            ),

          Text('askdasdhkjhds')
        ],
      ),
    );
  }
}

//child: Card(
//margin: const EdgeInsets.only(right: 14, left: 14, top: 32, bottom: 0),
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(12.0),
//),
//child: Container(
