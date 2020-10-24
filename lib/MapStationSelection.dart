import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartguide/MapWidget.dart';
import 'LanguageSwitcher.dart';

class MapStationSelecetion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //title and back button
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 34.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
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
                ),
              ),
            ),
            //language switcher
            Container(
              margin: EdgeInsets.only(bottom: 17.0),
              child: Center(
                child: LanguageSwitcher(),
              ),
            ),
            //Map
            Expanded(
              child: MapWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
