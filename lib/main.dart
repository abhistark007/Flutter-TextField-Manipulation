import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  TextInputType textInputType = TextInputType.text;
  bool isObscureText = false;
  static int _value = 1;
  int maxLength = 1;
  int color = 0;
  Color cursorColor = Colors.blue;
  List<Color> colorList = [Colors.blue, Colors.red, Colors.pink, Colors.purple];
  List<String> labelList = ['Blue', 'Red', 'Pink', 'Purple'];
  bool isBorderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advance Textfield"),
      ),
      body: Container(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controller,
                  maxLength: maxLength,
                  cursorColor: cursorColor,
                  cursorWidth: 2,
                  obscureText: isObscureText,
                  keyboardType: textInputType,
                  decoration: InputDecoration(
                    labelText: 'Welcome',
                    border: OutlineInputBorder(),
                    enabled: isBorderEnabled,
                    filled: true,
                    fillColor: Colors.grey[400],
                  ),
                ),
                Divider(),
                Text("Adjust Max Length of the TextField"),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.red[700],
                    inactiveTickMarkColor: Colors.red[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _value.toDouble(),
                    min: 1,
                    max: 100,
                    divisions: 100,
                    label: '$_value',
                    onChanged: (value) {
                      setState(
                        () {
                          _value = value.toInt();
                          maxLength = _value;
                        },
                      );
                    },
                  ),
                ),
                Divider(),
                Text("Adjust Cursor Color of the TextField"),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                    tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 7),
                    activeTickMarkColor: Colors.red[700],
                    inactiveTickMarkColor: Colors.red[100],
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: color.toDouble(),
                    min: 0,
                    max: 3,
                    divisions: 3,
                    label: '${labelList[color]}',
                    onChanged: (value) {
                      setState(
                        () {
                          color = value.toInt();
                          cursorColor = colorList[color];
                        },
                      );
                    },
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Clear Textfield"),
                      onPressed: () {
                        setState(() {
                          clear();
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      child: Text("Obscure Text"),
                      onPressed: () {
                        setState(() {
                          obscureText();
                        });
                      },
                    ),
                  ],
                ),
                Divider(),
                Text("Is TextField Enabled ?"),
                Checkbox(
                  value: isBorderEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      isBorderEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void obscureText() {
    if (isObscureText == false) {
      isObscureText = true;
    } else {
      isObscureText = false;
    }
  }

  void clear() {
    controller.text = '';
  }

  TextInputType keyboardTypeText() {
    if (textInputType == TextInputType.number) {
      clear();
    }
    return TextInputType.text;
  }

  TextInputType keyboardTypeNumber() {
    if (textInputType == TextInputType.text) {
      clear();
    }
    return TextInputType.number;
  }
}
