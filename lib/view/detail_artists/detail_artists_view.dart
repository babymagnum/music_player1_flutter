import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';

class DetailArtistsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                PlaceholderNetworkImage(
                  isFill: false,
                  url: 'https://images.unsplash.com/photo-1584545756756-b7b93b2eafbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
                  size: Size(double.infinity, MediaQuery.of(context).size.height * 0.5),
                  borderRadius: 0,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5, width: double.infinity,
                  color: Colors.black.withOpacity(0.35),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 20, right: 20,
                  child: Row(
                    children: <Widget>[
                      Parent(
                        style: ParentStyle()..height(35)..width(35)..background.color(ThemeColor.blackText)..borderRadius(all: 35/2),
                        child: Center(
                          child: Icon(Icons.keyboard_arrow_left, size: 25, color: Colors.white,),
                        ),
                      ),
                      Spacer(),
                      Parent(
                        style: ParentStyle()..height(35)..padding(horizontal: 12)..background.color(Colors.white.withAlpha(50))..borderRadius(all: 35/2),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.check_circle_outline, color: Colors.white, size: 20,),
                            SizedBox(width: 8,),
                            Text('FOLLOWING', style: ThemeTextStyle.ubuntuM.apply(fontSizeDelta: -3, color: Colors.white),)
                          ],
                        ),
                      ),
                      Spacer(),
                      Parent(
                        style: ParentStyle()..height(35)..width(35)..borderRadius(all: 35/2)..border(all: 2, color: Colors.white.withAlpha(50)),
                        child: Center(
                          child: Image.asset('assets/images/dots.png', height: 15, width: 15, color: Colors.white,),
                        ),
                      ),
                    ],
                  )
                ),
                Positioned(
                  bottom: 25,
                  left: 20, right: 20,
                  child: Column(
                    children: <Widget>[
                      Text('Rosalia', style: ThemeTextStyle.ubuntuM.apply(color: Colors.white, fontSizeDelta: 30),),
                      SizedBox(height: 5,),
                      Text('16k Followers', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white.withAlpha(180), fontSizeDelta: -2),),
                      SizedBox(height: 15,),
                      Parent(
                        style: ParentStyle()..height(35)..width(35)..background.color(Colors.white)..borderRadius(all: 35/2),
                        child: Center(
                          child: Icon(Icons.play_arrow, size: 20, color: Colors.black,),
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Rosalia's Top Songs", style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: -1),),
            )
          ],
        ),
      ),
    );
  }
}
