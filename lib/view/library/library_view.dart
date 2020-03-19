import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/library/widgets/albums_view.dart';
import 'package:dribbble_clone/view/library/widgets/artists_view.dart';
import 'package:dribbble_clone/view/library/widgets/playlists_view.dart';
import 'package:dribbble_clone/view/library/widgets/songs_view.dart';
import 'package:flutter/material.dart';

class LibraryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top + 20,),
            TabBar(
              indicatorColor: ThemeColor.whiteGray,
              isScrollable: true,
              labelStyle: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: 2, color: ThemeColor.whiteGray),
              unselectedLabelStyle: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: 2, color: ThemeColor.grey),
              tabs: [
                Tab(text: 'Songs',),
                Tab(text: 'Playlist',),
                Tab(text: 'Artists',),
                Tab(text: 'Album',),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SongsView(),
                  PlaylistsView(),
                  ArtistsView(),
                  AlbumsView()
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}

