import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/artists_top_songs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListArtistsTopSongsItem extends StatelessWidget {

  ListArtistsTopSongsItem({Key key, this.index, this.isLast, this.item}): super(key: key);

  final int index;
  final ArtistsTopSongs item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() {}),
      style: ParentStyle()..ripple(true)..margin(top: index == 0 ? 0 : 15, bottom: isLast ? 25 : 0, horizontal: 20)
        ..borderRadius(all: 5),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -5,
            child: Icon(index % 2 == 0 ? Icons.arrow_drop_up : Icons.arrow_drop_down, size: 20, color: index % 2 == 0 ? ThemeColor.green : Colors.redAccent,)
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 30,),
              PlaceholderNetworkImage(url: item.image ?? '', size: Size(40, 40), borderRadius: 5, isFill: false,),
              SizedBox(width: 10),
              Expanded(
                child: Text(item.name, style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: -2),)
              ),
              SizedBox(width: 10,),
              Parent(
                style: ParentStyle()..height(25)..width(25)..borderRadius(all: 25/2)..background.color(Colors.grey.withOpacity(0.5)),
                child: Center(
                  child: Image.asset('assets/images/dots.png', height: 10, width: 10, color: Colors.white,),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
