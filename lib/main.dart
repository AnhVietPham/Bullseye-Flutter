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

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hi Guys!'),
            content: Text('Your point: '),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes!'),
                onPressed: () {
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
                'Target Point: $defaultValue',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Slider(
                value: defaultValue.toDouble(),
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    defaultValue = value.round();
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 30),
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
                  showAlertDialog(context);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Start Over',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Target Point: $defaultValue',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Information',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
