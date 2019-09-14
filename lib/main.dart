import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'WeatherResponse.dart';
import 'myhome.dart';

void main() => runApp(MyHomePage());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myhome(),


    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  /////////////////// define Varable ///////////////
  var text = '';
  var icon = '';
  var city ="";
  var textf = TextEditingController();
  final Form_key = GlobalKey<FormState>();
 //////////////// get data erom api weather /////////
  Future<Response> fetchWeather() async {
    final response = await get(
        "http://api.apixu.com/v1/current.json?key=574e979e266849239a7214728182212&q=$city");
    var jsonString = response.body;
    var parsedJson = json.decode(jsonString);
    var weatherResponse = WeatherResponse.fromJson(parsedJson);
    setState(() {
      text = weatherResponse.current.condition.text;
      icon = weatherResponse.current.condition.icon;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Form(
                key: Form_key,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(hintText: "city"),
                        keyboardType: TextInputType.text,
                        controller: textf,
                        validator: (val) {
                          if (val.isEmpty) return "faield is empty";
                          if (val[0] != val[0].toUpperCase()) {
                            return "first char not capital";
                          }
                        }
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: RaisedButton(
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          onPressed:(){
                            if (Form_key.currentState.validate()) {
                              setState(() {
                                city = textf.text;
                              });
                              fetchWeather();
                            }
                          },
                          child: Text("Click")),
                    ),
                    Image.network('http:$icon'),
                    Text('$text')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}