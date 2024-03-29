import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:RTCV/colours.dart' as color;


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    //calls the _navigateToHome function
    _navigateToHome();
  }
  //navigates to HomePage widget
  _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      //displays the splashscreen picture.
      body: Center
        (child: Image.asset('assets/RTCV.png')),
    );
  }
}
