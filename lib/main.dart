import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
      primaryColor: Colors.white
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
  },
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('asset/DB.json'),
      builder: (context,snapshot){
        var mydata = json.decode(snapshot.data.toString());
        return Scaffold(
              body:Center(
                child: Text(mydata["name"]),
              )
        );
      },
    );
  }
}
