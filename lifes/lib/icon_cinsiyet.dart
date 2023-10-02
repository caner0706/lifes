import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;

  IconCinsiyet({this.cinsiyet = " ", this.icon = FontAwesomeIcons.venus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          cinsiyet,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}