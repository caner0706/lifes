import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {

  final Color renk;
  final Widget? child;

  MyContainer({this.renk = Colors.white,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5,),
        color: renk,
      ),
    );
  }
}