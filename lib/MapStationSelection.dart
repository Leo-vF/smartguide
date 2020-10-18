import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'station.dart';
import 'LanguageSwitcher.dart';

class MapStationSelecetion extends StatelessWidget {
  final String _jsonLocation = "assets/station02.json";
  final String _audioLocation = "assets/audios/Altes-Rathaus.mp3";
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
                                  builder: (context) => Station(_jsonLocation,
                                      _audioLocation), //"assets/station02.json"
                                ),
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
