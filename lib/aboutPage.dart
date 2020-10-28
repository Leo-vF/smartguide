import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String aboutText = "";

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    final de = prefs.getBool('de');
    bool language = de;

    var jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/about.json");
    var jsonData = json.decode(jsonString);
    if (language == true) {
      aboutText = jsonData[1];
    } else {
      aboutText = jsonData[0];
    }

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "About",
          style: TextStyle(color: Colors.grey[600], fontSize: 16.0),
        ),
        onPressed: () {
          _getData();
          showAboutDialog(
            context: context,
            applicationName: "Smartguide Holzkirchen",
            applicationIcon: MyAppIcon(),
            children: [
              Text(aboutText),
            ],
          );
        },
      ),
    );
  }
}

class MyAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 56.0,
        maxHeight: 56.0,
      ),
      child: Image.asset(
        "assets/images/icons/app_icon.jpg",
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
