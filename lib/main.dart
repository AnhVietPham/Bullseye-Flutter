import 'dart:core';
import 'dart:math';

import 'package:bullseyeflutter/screens/InformatinScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MaterialApp(
    home: BullsEyeStateFullApp(),
  ));
}

class BullsEyeStateFullApp extends StatefulWidget {
  @override
  BullsEyeState createState() {
    return BullsEyeState();
  }
}

class BullsEyeState extends State<BullsEyeStateFullApp> {
  int defaultValue = 50;
  int targetValue = Random().nextInt(100);
  int round = 1;
  int yourPoint = 0;
  int totalPoint = 0;

  void calculatePoint() {
    int differentValue = (defaultValue - targetValue).abs();
    yourPoint = 100 - differentValue;
  }

  void startOver() {
    this.targetValue = 0;
    this.round = 0;
    this.totalPoint = 0;
    this.yourPoint = 0;
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hi Guys!'),
            content: Text('Your point: $yourPoint'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes!'),
                onPressed: () {
                  setState(() {
                    this.totalPoint += yourPoint;
                    this.targetValue = Random().nextInt(100);
                    this.round++;
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Background.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Target Point: $targetValue',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Slider(
                    value: defaultValue.toDouble(),
                    min: 0,
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        this.defaultValue = value.round();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.amber,
                    disabledColor: Colors.grey,
                    child: Text(
                      'Hit Me!',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      calculatePoint();
                      showAlertDialog(context);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.green,
                              disabledColor: Colors.grey,
                              child: Text("Start Over",
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center),
                              onPressed: () {
                                setState(() {
                                  startOver();
                                });
                              },
                            ),
                          )),
                      Expanded(
                        child: Text(
                          'Point: $totalPoint',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Round: $round',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.green,
                              disabledColor: Colors.grey,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InformationScreen()));
                              },
                              child: Text(
                                'Information',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

