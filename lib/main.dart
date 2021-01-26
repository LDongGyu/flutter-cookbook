import 'package:flutter/material.dart';
import 'package:flutter_cookbook/MyAnimatedContainer.dart';
import 'package:flutter_cookbook/MyAnimatedOpacity.dart';
import 'package:flutter_cookbook/MyDrawer.dart';
import 'package:flutter_cookbook/MyPageState.dart';
import 'package:flutter_cookbook/PinocchioOnboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyOrientation.dart';
import 'MySnackBar.dart';
import 'MyTapController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  SharedPreferences _pref;
  bool isGuided = false;


  @override
  void initState() {
    super.initState();
    getGuide();
  }

  void getGuide() async{
      _pref = await SharedPreferences.getInstance();
      setState(() {
        isGuided = _pref.getBool('isGuided') ?? false;
      });
      if(!isGuided) Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnboardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('You have pushed the button this many times:'),
    );
  }
}
