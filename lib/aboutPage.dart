import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LegalNotice.dart';
import 'PrivacyPolicy.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String aboutText = "";
  String privacyEnDE = "";
  String legalEnDe = "";
  bool language;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    final prefs = await SharedPreferences.getInstance();
    final de = prefs.getBool('de');
    bool lang = de;
    this.language = lang;

    var jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/about.json");
    var jsonData = json.decode(jsonString);
    if (lang == true) {
      aboutText = jsonData[1];
      privacyEnDE = "Privacy Policy";
      legalEnDe = "Legal Notice";
    } else {
      aboutText = jsonData[0];
      privacyEnDE = "Datenschutz";
      legalEnDe = "Impressum";
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PrivacyPolicy(language)));
                      },
                      child: Text(privacyEnDE)),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LegalNotice(language)));
                      },
                      child: Text(legalEnDe))
                ],
              ),
              Image.asset('assets/images/general/about_us.jpg'),
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
