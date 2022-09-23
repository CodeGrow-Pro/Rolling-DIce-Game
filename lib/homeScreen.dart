// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  int leftDice = Random().nextInt(6) + 1;
  int rightDice = Random().nextInt(6) + 1;
  int color = 100;
  late AnimationController _controller;
  late CurvedAnimation animations;
  @override
  void initState() {
    super.initState();
    animation();
  }
  @override
  // ignore: override_on_non_overriding_member
  animation(){
     _controller = AnimationController(duration: Duration(seconds: 1),vsync:this);
       animations = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
     _controller.addListener(()
     {
      setState((){

     }); 
      print(_controller.value);});
     _controller.addStatusListener((status) {if(status==AnimationStatus.completed){
       setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      color = Random().nextInt(10) * 100;
    });
      print('Complete');
      _controller.reverse();
     }
     });
  }
 void dispose(){
  super.dispose();
  _controller.dispose();
 }
  void roll() {
     _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, color, 61, color),
      appBar: AppBar(
        title: Text("Dices"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(
                        height:200 - (animations.value*200),
                        color: Colors.white,
                        image:
                            AssetImage('assets/images/dice-png-$leftDice.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onDoubleTap: roll,
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(
                          height:200 - (animations.value*200),
                          color: Colors.white,
                          image: AssetImage('assets/images/dice-png-$rightDice.png'))),
                )),
              ],
            ),
            ElevatedButton(
              //style: style,
              onPressed: roll,
              child: const Text('Run'),
            ),
          ],
        ),
      ),
    );
  }
}
