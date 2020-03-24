import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/extent_scroll_physics.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/artists_top_songs.dart';
import 'package:dribbble_clone/view/detail_artists/widgets/list_artists_top_songs_item.dart';
import 'package:dribbble_clone/view/detail_artists/widgets/list_latest_releases_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailArtistsView extends StatelessWidget {

  List<ArtistsTopSongs> _listTopSongs = [
    ArtistsTopSongs('Aute Culture', 'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/056/640/original/f59029.jpeg?1559585772'),
    ArtistsTopSongs('Milionaria', 'https://media.pitchfork.com/photos/5d1cf95f304621000999709d/1:1/w_160/Rosalia.jpg'),
    ArtistsTopSongs('Con Altura', 'https://i1.sndcdn.com/artworks-000512977626-1claqk-t500x500.jpg'),
  ];
  List<String> _listLatestReleases = [
    'https://d2tml28x3t0b85.cloudfront.net/tracks/artworks/001/056/640/original/f59029.jpeg?1559585772',
    'https://media.pitchfork.com/photos/5d1cf95f304621000999709d/1:1/w_160/Rosalia.jpg',
    'https://i1.sndcdn.com/artworks-000512977626-1claqk-t500x500.jpg',
    'https://i1.sndcdn.com/artworks-000512977626-1claqk-t500x500.jpg',
    'https://i1.sndcdn.com/artworks-000512977626-1claqk-t500x500.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
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
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: _listTopSongs.length,
                  itemBuilder: (_, index) => ListArtistsTopSongsItem(
                    item: _listTopSongs[index],
                    isLast: index == _listTopSongs.length - 1,
                    index: index,
                  )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Latest Releases', style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: -1),),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200, width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    physics: ExtentScrollPhysics(itemExtent: MediaQuery.of(context).size.width * 0.4),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ListLatestReleasesItem(
                        image: _listLatestReleases[index],
                        isFirst: index == 0,
                        isLast: index == _listLatestReleases.length - 1,
                      ),
                    ),
                    itemCount: _listLatestReleases.length
                  ),
                ),
                SizedBox(height: 74,)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Parent(
              style: ParentStyle()..background.color(ThemeColor.bg_screen)..height(54)..margin(horizontal: 20, bottom: 20)..borderRadius(all: 53/2)
                ..padding(horizontal: 8),
              child: Row(
                children: <Widget>[
                  PlaceholderNetworkImage(
                    url: 'https://i1.sndcdn.com/artworks-000512977626-1claqk-t500x500.jpg',
                    size: Size(40, 40),
                    borderRadius: 40/2,
                    isFill: false
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Playing Now', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black26, fontSizeDelta: -5),),
                        SizedBox(height: 5,),
                        Text('Con Altura', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black54.withAlpha(80), fontSizeDelta: -2),)
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  Parent(
                    style: ParentStyle()..ripple(true)..height(40)..width(40)..borderRadius(all: 40/2)..background.color(Colors.black26.withAlpha(30)),
                    child: Center(
                      child: Icon(Icons.pause, size: 23, color: Colors.black38,),
                    ),
                  ),
                  SizedBox(width: 10),
                  Parent(
                    style: ParentStyle()..ripple(true)..height(40)..width(40)..borderRadius(all: 40/2)..border(all: 2, color: Colors.black38.withAlpha(50)),
                    child: Center(
                      child: Icon(Icons.fast_forward, size: 23, color: Colors.black,),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
