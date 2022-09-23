import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen.dart';
import 'homeScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: 'assets/images/dice_splash.gif' ,
            splashIconSize: 900,
            nextScreen: HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            //pageTransitionType: PageTransitionType.scale,
            backgroundColor: Colors.blue));
        // home:HomeScreen(),
    // );
  }
}
