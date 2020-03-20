import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:flutter/material.dart';

class BottomSheetSongs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Parent(
          style: ParentStyle()..width(50)..height(8)..borderRadius(all: 4)..background.color(ThemeColor.grey),
        ),
        SizedBox(height: 5),
        Parent(
          style: ParentStyle()..background.color(ThemeColor.blackPrimary)..borderRadius(topLeft: 10, topRight: 10)..width(double.infinity),
          child: Column(
            children: <Widget>[
              Text('tes', style: TextStyle(color: Colors.white),),
              Text('tes', style: TextStyle(color: Colors.white),),
              Text('tes', style: TextStyle(color: Colors.white),),
              Text('tes', style: TextStyle(color: Colors.white),),
            ],
          ),
        )
      ],
    );
  }
}