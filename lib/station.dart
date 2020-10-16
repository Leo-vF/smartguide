import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Station extends StatefulWidget {
  Station(this.name, this.jsonLocation);
  final String name;
  final String jsonLocation;

  @override
  _StationState createState() => _StationState();
}

class _StationState extends State<Station> {
  bool language = false;

  @override
  void initState() {
    _getBools();
    super.initState();
  }

  Future<void> _getBools() async {
    final prefs = await SharedPreferences.getInstance();
    final de = prefs.getBool('de');
    language = de;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                color: Color(0xffa0c510),
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xffa0c510),
                    fontSize: 28,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                background: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 34.0),
                        child: Center(
                          child: Container(
                            child: Text(
                              'SMARTGUIDE',
                              style: TextStyle(
                                color: Color(0xffa0c510),
                                fontSize: 36,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var jsonData = json.decode(snapshot.data.toString());
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (language == true) {
                    //
                    //Falls language true ist, ist die gewählte Sprache Deutsch
                    //
                    String lang = "de";
                    String type = jsonData["content"][lang][index + 1]["type"];
                    if (type == "img") {
                      return Image.asset(
                          jsonData["content"][lang][index + 1]["content"]);
                    } else if (type == "text") {
                      return Text(
                        jsonData["content"][lang][index + 1]["content"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                    return Text("Content failed to load");
                  } else {
                    //
                    //Falls language false ist, ist die gewählte Sprache Englisch
                    //
                    String lang = "en";
                    String type = jsonData["content"][lang][index + 1]["type"];
                    if (type == "img") {
                      return Image.asset(
                          jsonData["content"][lang][index + 1]["content"]);
                    } else if (type == "text") {
                      return Text(
                        jsonData["content"][lang][index + 1]["content"],
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      );
                    }
                    return Text("Content failed to load");
                  }
                },
                itemCount: jsonData["content"]["en"].length - 1,
              );
            },
            future:
                DefaultAssetBundle.of(context).loadString(widget.jsonLocation),
          ),
        ),
      ),
      //bottomNavigationBar: , takes Widget; planned to put the audio player here
    );
  }
}
