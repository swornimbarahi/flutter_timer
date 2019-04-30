import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return new MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int secondcounter = 0;
  bool countdown = false;
  int otherCounter = 0;
  void incCounterSec() {
    setState(() {
      secondcounter++;
    });
  }

  void incCounterMin() {
    setState(() {
      secondcounter += 60;
    });
  }

  void incCounterHrs() {
    setState(() {
      secondcounter += (3600);
    });
  }

  void decCounterSec() {
    if (secondcounter <= 0) return;
    setState(() {
      secondcounter--;
    });
  }

  void decCounterMin() {
    if (secondcounter - 60 <= 0) {
      setState(() {
        secondcounter = 0;
      });
    }
    setState(() {
      secondcounter -= 60;
    });
  }

  void decCounterHrs() {
    if (secondcounter - 3600 <= 0) {
      setState(() {
        secondcounter = 0;
      });
    }
    setState(() {
      secondcounter -= (3600);
    });
  }

  void startCounter() {
    if (countdown) return;
    setState(() {
      countdown = true;
    });
    keepCounting();
  }

  void keepCounting() {
    if (!countdown) return;
    if (secondcounter == 0) {
      setState(() {
        countdown = false;
      });
      return;
    }
    setState(() {
      secondcounter--;
      countdown = true;
    });
    Timer(Duration(seconds: 1), keepCounting);
  }

  void stopCounter() {
    setState(() {
      countdown = false;
    });
  }

  void setWashTime() {
    setState(() {
      secondcounter = 1800;
    });
  }

  void setDryTime() {
    setState(() {
      secondcounter = 3600;
    });
  }

  void setZeroTime() {
    setState(() {
      secondcounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Timer',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.blue,
        ),
        body: new Container(
            child: new Center(
                child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: Text("Set Wash Time"),
              onPressed: setWashTime,
            ),
            new RaisedButton(
              child: Text("Set Dry Time"),
              onPressed: setDryTime,
            ),
            new RaisedButton(
              child: Text("Set Zero Time"),
              onPressed: setZeroTime,
            ),
            new Container(
                child: new Center(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Colors.blue,
                            onPressed: incCounterHrs,
                            iconSize: 40,
                          ),
                          new Text(
                              '${Duration(seconds: secondcounter).inHours % 60 < 10 ? "0" + (Duration(seconds: secondcounter).inHours % 60).toString() : Duration(seconds: secondcounter).inHours % 60}',
                              style: new TextStyle(fontSize: 40.0)),
                          new Text('Hours'),
                          new IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.blue,
                            onPressed: decCounterHrs,
                            iconSize: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      child: new Center(
                          child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        ":",
                        style: new TextStyle(fontSize: 40.0),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                      )
                    ],
                  ))),
                  new Container(
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Colors.blue,
                            onPressed: incCounterMin,
                            iconSize: 40,
                          ),
                          new Text(
                              '${Duration(seconds: secondcounter).inMinutes % 60 < 10 ? "0" + (Duration(seconds: secondcounter).inMinutes % 60).toString() : Duration(seconds: secondcounter).inMinutes % 60}',
                              style: new TextStyle(fontSize: 40.0)),
                          new Text('Minutes'),
                          new IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.blue,
                            onPressed: decCounterMin,
                            iconSize: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      child: new Center(
                          child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        ":",
                        style: new TextStyle(fontSize: 40.0),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                      )
                    ],
                  ))),
                  new Container(
                    child: new Center(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new IconButton(
                            icon: Icon(Icons.add_circle),
                            color: Colors.blue,
                            onPressed: incCounterSec,
                            iconSize: 40,
                          ),
                          new Text(
                              '${Duration(seconds: secondcounter).inSeconds % 60 < 10 ? "0" + (Duration(seconds: secondcounter).inSeconds % 60).toString() : Duration(seconds: secondcounter).inSeconds % 60}',
                              style: new TextStyle(fontSize: 40.0)),
                          new Text('Seconds'),
                          new IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.blue,
                            onPressed: decCounterSec,
                            iconSize: 40,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )),
            new RaisedButton(
              child: Text("Start"),
              onPressed: startCounter,
            ),
            new RaisedButton(
              child: Text("Stop"),
              onPressed: stopCounter,
            )
          ],
        ))));
  }
}
