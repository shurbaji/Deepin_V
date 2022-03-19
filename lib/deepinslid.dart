import 'package:flutter/material.dart';

class deepinslid extends StatelessWidget {
  final String title;
  final Image image;

  deepinslid({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(),
    );
  }
}
