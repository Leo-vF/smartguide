import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:smartguide/station.dart';

class MapWidget extends StatefulWidget {
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> allMarkers = [];

  List<Marker> setMarkers() {
    return allMarkers;
  }

  void makeMarkers() async {
    var jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/stations.json");
    var pathList = jsonDecode(jsonString);
    for (String path in pathList) {
      jsonString = await DefaultAssetBundle.of(context).loadString(path);
      var markerData = jsonDecode(jsonString);
      setState(() {
        allMarkers.add(
          new Marker(
            width: 45.0,
            height: 45.0,
            point: new LatLng(markerData["latitiude"], markerData["longitude"]),
            builder: (context) => new Container(
              child: IconButton(
                icon: Icon(Icons.location_on),
                color: Color(0xffa0c510),
                iconSize: 45.0,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Station(
                          path, markerData["audio"]), //"assets/station02.json"
                    ),
                  );
                },
              ),
            ),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    makeMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          new MarkerLayerOptions(markers: setMarkers())
        ],
      ),
    );
  }
}
