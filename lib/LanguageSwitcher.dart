import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageSwitcher extends StatefulWidget {
  @override
  _LanguageSwitcherState createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  List<bool> isSelected = [true, false];
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
