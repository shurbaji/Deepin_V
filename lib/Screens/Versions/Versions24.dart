import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ScreenVerion.dart';

class Verions_Table {
  String name;
  String image;
  Verions_Table({required this.image, required this.name});
}

List images = [
  'images/deepin24.jpg',
  'images/deepin23.jpg',
  'images/deepin22.jpg',
  'images/deepin21.jpg',
  'images/deepin20.jpg',
  'images/deepin15.jpg',
];

_launchURL() async {
  const url =
      'https://drive.google.com/file/d/1PfbG4m5Q6P8DRIpXJ04wPHvWq9XjH77Z/view?usp=sharing';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Versions extends StatefulWidget {
  const Versions({Key? key}) : super(key: key);
  @override
  State<Versions> createState() => _VersionsState();
}

ThemeData _lightTheme = ThemeData(
  accentColor: Colors.pink,
  brightness: Brightness.light,
  primaryColor: Colors.blue,
);

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

bool _light = true;

class _VersionsState extends State<Versions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _light ? _lightTheme : _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Color(0xff33ccff),
                  Color(0xffff99cc),
                ],
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/deepin24.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff33ccff),
                    Color(0xffff99cc),
                  ],
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _launchURL();
                  });
                },
                child: Text(
                  'Download OS',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
