import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Station extends StatelessWidget {
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
                  "01 RATHAUS",
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
                      //Language Switcher (nicht sicher ob das notwendig ist)
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            children: [
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam elit, pharetra a facilisis vel, ornare aliquam tellus. Vivamus molestie vehicula dolor vitae pharetra. Praesent at sollicitudin ex, quis pharetra diam. Fusce a elit mi. Cras efficitur libero ullamcorper ornare mollis. Donec pulvinar dictum ipsum, vitae pharetra turpis suscipit vitae. Curabitur sapien odio, pharetra nec tincidunt ac, consequat vitae risus. \n Sed neque nisl, rutrum quis nibh nec, elementum faucibus nisl. Duis eget est quis libero vestibulum posuere in in arcu. Aliquam erat volutpat. Proin vel enim sapien. Ut tellus lorem, tempor eu congue id, commodo non mi. Mauris pellentesque purus.\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image(
                image: NetworkImage(
                    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
