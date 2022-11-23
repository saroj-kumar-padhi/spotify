import 'package:chair/Screens/Home.dart';
import 'package:chair/Screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});


  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1600),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp() ,));
  }
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      color: Colors.black,
      
      child: Center(
        child: Image.asset('lib/assets/mania.jpeg'),
      ),
    ),);
  }
}