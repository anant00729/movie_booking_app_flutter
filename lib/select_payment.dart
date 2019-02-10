import 'package:flutter/material.dart';

class SelectPayment extends StatefulWidget {
  @override
  _SelectPaymentState createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select Payment Method'),
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(6.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Tickets Booked', style: TextStyle(fontSize: 16.0)),
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
                      Text('Amt. Payable', style: TextStyle(fontSize: 16.0)),
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
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Card(

                        margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: ListTile(
//                        contentPadding: const EdgeInsets.all(8.0),
                            trailing: Radio(value: true),
                            title: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: i == 0 ? const EdgeInsets.only(top: 4.0) : null,
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage("https://avatars1.githubusercontent.com/u/26194642?s=88&v=4")
                                    )
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.all(8.0)),
                                Text('My Wallet'),

                              ],

                            ),
                            subtitle: i == 0 ? Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              child:  Text('My Wallet'),
                            ): null

                            //i == 0 ? Text('My Wallet') : null,
                          ),
                        )
                      ),
                    );
                  }),
            )
          ],
        ),
        bottomNavigationBar: FlatButton(child: Text('Confirm'),onPressed: (){})
    );
  }
}
