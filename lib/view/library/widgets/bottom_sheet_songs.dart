import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:flutter/material.dart';

class BottomSheetSongs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Parent(
            style: ParentStyle()..width(50)..height(8)..borderRadius(all: 4)..background.color(ThemeColor.grey),
          ),
          SizedBox(height: 5,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            color: Colors.red,
            child: Column(
              children: <Widget>[
                Text('tes', style: TextStyle(color: Colors.white),)
              ],
            ),
          )
        ],
      ),
    );
  }
}