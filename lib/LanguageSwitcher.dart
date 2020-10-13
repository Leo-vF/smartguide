import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  List<bool> isSelected = [false, false];

  @override
  void initState() {
    _getBools();
    super.initState();
  }

  Future<void> _getBools() async {
    final prefs = await SharedPreferences.getInstance();
    final de = prefs.getBool('de');
    final en = prefs.getBool('en');
    if (de == null && en == null) {
      isSelected = [true, false];
    } else if (de == null && en != null) {
      isSelected = [!en, en];
    } else if (de != null && en == null) {
      isSelected = [de, !de];
    } else {
      isSelected = [de, en];
    }
    setState(() {});
  }

  Future<void> _setBools() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("de", isSelected[0]);
    await prefs.setBool("en", isSelected[1]);
  }

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
            _setBools();
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
