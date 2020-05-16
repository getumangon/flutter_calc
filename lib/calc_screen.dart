import 'package:first_app/custom_theme.dart';
import 'package:first_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<CalculatorScreen> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

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
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: CustomTheme.of(context),
      home: Scaffold(
          backgroundColor: CustomTheme.of(context).primaryColor,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon:
                        Icon((!darkTheme) ? Icons.brightness_2 : Icons.wb_sunny),
                    color: CustomTheme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        print("message $darkTheme");
                        darkTheme = !darkTheme;
                      });
                      _changeTheme(context,
                          (darkTheme) ? MyThemeKeys.LIGHT : MyThemeKeys.DARK);
                    },
                  ),
                ),
                Container(
                  color: CustomTheme.of(context).primaryColor,
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
                    style: TextStyle(color: CustomTheme.of(context).accentColor, fontSize: 55),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    color: CustomTheme.of(context).primaryColor,
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
                                        fontSize: 28,
                                        color: CustomTheme.of(context)
                                            .textSelectionColor)),
                                onPressed: () {},
                                padding: EdgeInsets.all(14),
                                shape: CircleBorder(),
                                color: CustomTheme.of(context).splashColor,
                              ),
                            ),
                            Expanded(
                                child: RaisedButton(
                              child: Icon(
                                Icons.backspace,
                                color:
                                    CustomTheme.of(context).textSelectionColor,
                                size: 28,
                              ),
                              onPressed: () {},
                              padding: EdgeInsets.all(22),
                              shape: CircleBorder(),
                              color: CustomTheme.of(context).splashColor,
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
    );
  }

  RaisedButton buildRaisedButton(text, onPress) {
    return RaisedButton(
      child: Text(text,
          style: GoogleFonts.poppins(
              fontSize: 32, color: CustomTheme.of(context).cursorColor)),
      onPressed: onPress,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      color: Colors.white,
    );
  }

  FlatButton buildFlatButton(text, onPress) {
    return FlatButton(
      child: Text(text,
          style: GoogleFonts.poppins(
              fontSize: 34, color: CustomTheme.of(context).textSelectionColor)),
      onPressed: onPress,
      padding: EdgeInsets.all(10),
      shape: CircleBorder(),
      color: Colors.transparent,
    );
  }
}