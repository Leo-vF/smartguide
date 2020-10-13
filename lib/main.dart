import 'package:flutter/material.dart';
import 'MapStationSelection.dart';
import 'LanguageSwitcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holzkirchen Guide',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Willkommen zum
            Container(
              margin: EdgeInsets.only(
                  left: 41.0, right: 32.0, top: 44.0, bottom: 16.0),
              child: Center(
                child: Text(
                  'Willkommen zum',
                  style: TextStyle(
                    color: Color(0xffbdbdbd),
                    fontSize: 24,
                    fontFamily: 'Raleway',
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  'SMARTGUIDE',
                  style: TextStyle(
                    color: Color(0xffa0c510),
                    fontSize: 45,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //Holzkirchen
            Container(
              child: Center(
                child: Text(
                  'HOLZKIRCHEN',
                  style: TextStyle(
                    color: Color(0xffa0c510),
                    fontSize: 36,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            //leerer platz
            Expanded(
              child: Container(),
            ),
            //language switcher
            Container(
              margin: EdgeInsets.only(left: 50.0),
              child: LanguageSwitcher(),
            ),
            //zum Guide
            Container(
              margin: EdgeInsets.only(
                  left: 34.0, right: 95.0, bottom: 67.64, top: 26.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => MapStationSelecetion()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Text(
                      'zum Guide',
                      style: TextStyle(
                        color: Color(0xff828282),
                        fontSize: 32,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 32,
                      color: Color(0xff828282),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
