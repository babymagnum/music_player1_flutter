import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/songs.dart';
import 'package:dribbble_clone/view/library/widgets/list_songs_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetSongs extends StatelessWidget {

  BottomSheetSongs({Key key, @required this.listSongs}): super(key: key);

  final List<Songs> listSongs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Parent(
          style: ParentStyle()..width(50)..height(8)..borderRadius(all: 4)..background.color(ThemeColor.blackPrimary),
        ),
        SizedBox(height: 8),
        Parent(
          style: ParentStyle()..background.color(ThemeColor.blackPrimary)..borderRadius(topLeft: 10, topRight: 10)..padding(horizontal: 25)..width(double.infinity),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Latino Gang', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: 2),),
                        SizedBox(height: 10,),
                        Text('105 Songs', style: ThemeTextStyle.ubuntuR.apply(color: ThemeColor.input_color, fontSizeDelta: -4),)
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  Parent(
                    style: ParentStyle()..height(40)..width(40)..ripple(true)..borderRadius(all: 20)..background.color(Colors.blueAccent),
                    child: Center(
                      child: Icon(Icons.play_arrow, color: Colors.white, size: 20,),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Parent(
                    style: ParentStyle()..height(40)..width(40)..borderRadius(all: 20)..ripple(true)..border(all: 2, color: ThemeColor.grey.withAlpha(60)),
                    child: Center(
                      child: Image.asset('assets/images/dots.png', color: Colors.white, width: 15, height: 15,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: MediaQuery.of(context).size.height * 0.37,
                child: NotificationListener(
                  child: ListView.builder(
                    itemCount: listSongs.length,
                    itemBuilder: (_, index) => ListSongsItem(item: listSongs[index], isLast: index == listSongs.length - 1),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}