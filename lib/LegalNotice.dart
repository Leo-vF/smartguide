import 'package:flutter/material.dart';

class LegalNotice extends StatefulWidget {
  LegalNotice(this.lang);
  final bool lang;

  @override
  _LegalNoticeState createState() => _LegalNoticeState(lang);
}

class _LegalNoticeState extends State<LegalNotice> {
  _LegalNoticeState(this.lang);
  final bool lang;
  String title;

  @override
  void initState() {
    title = lang ? "Impressum" : "Legal Notice";
    super.initState();
  }

  Widget german(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        "coming soon",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget english(BuildContext context) {
    return SingleChildScrollView(
      child: Text(
        "coming soon",
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffa0c510),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(title),
      ),
      body: SafeArea(
        child: lang ? german(context) : english(context),
      ),
    );
  }
}
