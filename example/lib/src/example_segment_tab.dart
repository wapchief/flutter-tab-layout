import 'package:flutter/material.dart';

import 'package:flutter_tab/flutter_tab.dart';

class SimpleSegmentTab extends StatelessWidget{

 final List<TabEntity> tabs = [
    TabEntity('汇总', true),
    TabEntity('昨日', false),
    TabEntity('近七天', false),
    TabEntity('近30天', false),
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.orange,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SegmentTabLayout(
                tabs,
                voidCallback: (res) {
                  print(res.toString());
                },
              )
            ],
          ),
        )
      );
  }


}