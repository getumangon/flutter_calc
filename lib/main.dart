import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _controller;
  bool darkTheme = true;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme
          ? ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.red,
              textSelectionColor: Colors.white,
              buttonColor: Color.fromRGBO(2, 150, 136, 1))
          : ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.red,
              textSelectionColor: Colors.white,
              buttonColor: Color.fromRGBO(2, 150, 136, 1)),
      home: Scaffold(
          backgroundColor: _themeData.primaryColor,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.wb_sunny),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        log("message $darkTheme");
                        darkTheme = !darkTheme;
                      });
                    },
                  ),
                ),
                Container(
                  color: Color.fromRGBO(40, 54, 99, 1),
                  height: 245,
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _controller,
                    showCursor: false,
                    textDirection: TextDirection.rtl,
                    enableInteractiveSelection: false,
                    decoration: InputDecoration(border: InputBorder.none),
                    strutStyle: StrutStyle(
                      height: 50,
                    ),
                    readOnly: true,
                    style: TextStyle(color: Colors.white, fontSize: 55),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    color: Color.fromRGBO(40, 54, 55, 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                child: Text('AC',
                                    style: GoogleFonts.poppins(
                                        fontSize: 30, color: Colors.white)),
                                onPressed: () {},
                                padding: EdgeInsets.all(12),
                                shape: CircleBorder(),
                                color: Colors.grey,
                              ),
                            ),
                            Expanded(
                                child: RaisedButton(
                              child: Icon(
                                Icons.backspace,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {},
                              padding: EdgeInsets.all(22),
                              shape: CircleBorder(),
                              color: Colors.grey,
                            )),
                            Expanded(
                              child: buildRaisedButton('%', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildRaisedButton('÷', () {
                                _controller.text = '2';
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: buildFlatButton('7', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('8', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('9', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildRaisedButton('x', () {
                                _controller.text = '2';
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: buildFlatButton('4', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('5', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('6', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildRaisedButton('-', () {
                                _controller.text = '2';
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: buildFlatButton('1', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('2', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('3', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildRaisedButton('+', () {
                                _controller.text = '2';
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: buildFlatButton('±', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('0', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildFlatButton('.', () {
                                _controller.text = '2';
                              }),
                            ),
                            Expanded(
                              child: buildRaisedButton('=', () {
                                _controller.text = '2';
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }

  RaisedButton buildRaisedButton(text, onPress) {
    return RaisedButton(
      child: Text(text,
          style: GoogleFonts.poppins(
              fontSize: 32, color: Theme.of(context).primaryColor)),
      onPressed: onPress,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      color: Colors.white,
    );
  }

  FlatButton buildFlatButton(text, onPress) {
    return FlatButton(
      child: Text(text,
          style: GoogleFonts.poppins(fontSize: 34, color: Colors.white)),
      onPressed: onPress,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      color: Colors.transparent,
    );
  }
}
