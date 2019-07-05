import 'package:flutter/material.dart';

class SegmentTabLayout extends StatefulWidget {
  final List<TabEntity> tabs;
  final TextStyle textStyle;
  final TextStyle textStyleSelect;
  final double height;
  final Color bgColor;
  final Color bgColorSelect;
  final double radius;
  final Color lineColor;
  final double itemWidth;
  final ValueChanged voidCallback;
  SegmentTabLayout(this.tabs,
      {this.textStyle,
        this.textStyleSelect,
        this.height,
        this.bgColor,
        this.bgColorSelect,
        this.radius,
        this.itemWidth,
        this.lineColor,
        this.voidCallback});

  @override
  State createState() {
    return TabLayoutView();
  }
}

class TabLayoutView extends State<SegmentTabLayout> {
  List<Widget> _listItem = [];
  int selectIndex = 0;
  List<TabEntity> myTabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myTabs = widget.tabs;
    _listItem = [];
    for (int i = 0; i < myTabs.length; i++) {
      var itemWidget = GestureDetector(
        child: Container(
          width: widget.itemWidth != null ? widget.itemWidth : 70.0,
          decoration: BoxDecoration(
              color: myTabs[i].select != null && myTabs[i].select
                  ? widget.bgColorSelect != null
                  ? widget.bgColorSelect
                  : Color(0xffffffff)
                  : widget.bgColor != null ? widget.bgColor : Color(0x00000000),
              border: Border(
                  left: i == 0
                      ? BorderSide.none
                      : BorderSide(
                      color: widget.lineColor != null
                          ? widget.lineColor
                          : Colors.white),
                  top: BorderSide.none,
                  bottom: BorderSide.none,
                  right: BorderSide.none)),
          child: Center(
            child: Text(myTabs[i].name,
                style: myTabs[i].select != null && myTabs[i].select
                    ? widget.textStyleSelect != null
                    ? widget.textStyleSelect
                    : TextStyle(color: Color(0xff83cbe6), fontSize: 14.0)
                    : widget.textStyle != null
                    ? widget.textStyle
                    : TextStyle(color: Colors.white, fontSize: 14.0)),
          ),
        ),
        onTap: () {
          updateSelected(i);
          widget.voidCallback(i);
        },
      );
      _listItem.add(itemWidget);
    }
  }

  //更新选中状态
  updateSelected(int pisition) {
    if(pisition==selectIndex){
      return;
    }
    _listItem=[];
    if (_listItem != null && myTabs[pisition].select != null) {
      this.setState(() {
        myTabs[pisition].select = true;
        myTabs[selectIndex].select = false;
        selectIndex = pisition;
        for (int i = 0; i < myTabs.length; i++) {
          var itemWidget = GestureDetector(
            child: Container(
              width: widget.itemWidth != null ? widget.itemWidth : 70.0,
              decoration: BoxDecoration(
                  color: myTabs[i].select != null && myTabs[i].select
                      ? widget.bgColorSelect != null
                      ? widget.bgColorSelect
                      : Color(0xffffffff)
                      : widget.bgColor != null ? widget.bgColor : Color(0x00000000),
                  border: Border(
                      left: i == 0
                          ? BorderSide.none
                          : BorderSide(
                          color: widget.lineColor != null
                              ? widget.lineColor
                              : Colors.white),
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      right: BorderSide.none)),
              child: Center(
                child: Text(myTabs[i].name,
                    style: myTabs[i].select != null && myTabs[i].select
                        ? widget.textStyleSelect != null
                        ? widget.textStyleSelect
                        : TextStyle(color: Color(0xff83cbe6), fontSize: 14.0)
                        : widget.textStyle != null
                        ? widget.textStyle
                        : TextStyle(color: Colors.white, fontSize: 14.0)),
              ),
            ),
            onTap: () {
              updateSelected(i);
              widget.voidCallback(i);
            },
          );
          _listItem.add(itemWidget);
        }
      });
//      print('onTap--$pisition----$selectIndex');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height != null ? widget.height : 30.0,
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.lineColor != null ? widget.lineColor : Colors.white,
              width: 1.0),
          borderRadius: BorderRadius.all(
              Radius.circular(widget.radius != null ? widget.radius : 5.0))),
      child: Row(
        children: _listItem,
      ),
    );
  }
}

class TabEntity {
  final String name;
  bool select;

  TabEntity(this.name, this.select);
}
