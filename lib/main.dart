import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'station.dart';

List<bool> isSelected = [true, false];

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
              child: Container(
                child: FlutterMap(
                  options: new MapOptions(
                    center: new LatLng(47.877532, 11.701889),
                    zoom: 17.0,
                  ),
                  layers: [
                    new TileLayerOptions(
                      urlTemplate:
                          "https://api.mapbox.com/styles/v1/tobi-b3/ckafdph8o27bg1imt2qfyag92/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidG9iaS1iMyIsImEiOiJja2E4OGYwd3QwMjM2MnFxam92ZDA0NXU3In0.kIr2lwkLv9_UwptepgUtaA",
                    ),
                    new MarkerLayerOptions(markers: [
                      new Marker(
                        width: 45.0,
                        height: 45.0,
                        point: new LatLng(47.877632, 11.701489),
                        builder: (context) => new Container(
                          child: IconButton(
                            icon: Icon(Icons.location_on),
                            color: Color(0xffa0c510),
                            iconSize: 45.0,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Station()),
                              );
                            },
                          ),
                        ),
                      ),
                    ])
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

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff4f4f4),
      child: ToggleButtons(
        color: Color(0xffa0c510),
        fillColor: Color(0xffa0c510),
        selectedColor: Colors.white,
        renderBorder: false,
        isSelected: isSelected,
        onPressed: (index) {
          setState(() {
            isSelected[index] = !isSelected[index];
            isSelected[(index + 1) % 2] = !isSelected[(index + 1) % 2];
          });
        },
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            child: Text(
              'DE',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            child: Text(
              'EN',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
