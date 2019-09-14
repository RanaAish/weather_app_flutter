import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myhome extends StatelessWidget
{
  int count=0;
  void click()
  {
    print(count++);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(appBar: AppBar(
      title: Text("task"),
    ),
      body:
      Column(
        children: <Widget>[
          FlatButton(  child: Text("Message"),
        onPressed: click,
            color: Colors.blue ,
      ),
   ]));
  }
}

