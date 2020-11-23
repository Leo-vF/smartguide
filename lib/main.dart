import 'package:flutter/material.dart';
import 'package:smartguide/aboutPage.dart';
import 'MapStationSelection.dart';
import 'LanguageSwitcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smartguide Holzkirchen',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 40.0),
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
              child: Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.asset('assets/images/general/start_page.jpg')),
              ),
            ),
            //language switcher
            Container(
              margin: EdgeInsets.only(left: 50.0),
              child: LanguageSwitcher(),
            ),
            //zum Guide
            Container(
              margin: EdgeInsets.only(
                  left: 34.0, right: 95.0, bottom: 10.0, top: 26.0),
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
                      'Start Guide',
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
            AboutPage(),
          ],
        ),
      ),
    );
  }
}
