import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/presentations/screens/weather_homepage.dart';

import '../../utils.dart/color_constants.dart';
import '../../utils.dart/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Get.to(WeatherHomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorConstant.splashBackGround ,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Text("Lilac",style:TextStyles.splashText,),
      Text("Flutter",style:TextStyles.splashText),
      Text("Assignment",style:TextStyles.splashText),
        ],
      )),
    );
  }
}
