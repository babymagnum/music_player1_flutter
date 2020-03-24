import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/songs.dart';
import 'package:flutter/material.dart';

class ListSongsItem extends StatelessWidget {

  ListSongsItem({Key key, this.item, this.isLast}): super(key: key);

  final Songs item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() => print('list song tapped')),
      style: ParentStyle()..margin(top: 20, bottom: isLast ? 110 : 0)..ripple(true)..borderRadius(all: 5),
      child: Row(
        children: <Widget>[
          PlaceholderNetworkImage(isFill: false, url: item.image, size: Size(60, 60), borderRadius: 5,),
          SizedBox(width: 13,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.name, style: ThemeTextStyle.ubuntuR.apply(color: Colors.white),),
                SizedBox(height: 10,),
                Row(
                  children: <Widget>[
                    Parent(
                      style: ParentStyle()..height(6)..width(6)..borderRadius(all: 3)..background.color(ThemeColor.green),
                    ),
                    SizedBox(width: 7,),
                    Text(item.singer, style: ThemeTextStyle.ubuntuR.apply(color: ThemeColor.input_color, fontSizeDelta: -2),)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Parent(
            style: ParentStyle()..height(25)..width(25)..borderRadius(all: 25/2)..ripple(true)..background.color(ThemeColor.input_color.withAlpha(120)),
            child: Center(
              child: Image.asset('assets/images/dots.png', color: Colors.white, width: 8, height: 8,),
            ),
          ),
        ],
      ),
    );
  }
}
