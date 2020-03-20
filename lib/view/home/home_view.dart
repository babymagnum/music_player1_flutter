import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/view/account/account_view.dart';
import 'package:dribbble_clone/view/grid_menu/grid_menu_view.dart';
import 'package:dribbble_clone/view/library/library_view.dart';
import 'package:dribbble_clone/view/people/people_view.dart';
import 'package:dribbble_clone/view/search/search_view.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme_color.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var selectedIndex = 0;
  List<Widget> _listScreen = [GridMenuView(), SearchView(), LibraryView(), PeopleView(), AccountView()];

  onItemTapped(int index) {
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: selectedIndex,
            children: _listScreen,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Parent(
              style: ParentStyle()..height(55)..borderRadius(all: 55/2)..width(double.infinity)..margin(horizontal: 20)
                ..background.color(Colors.black)..padding(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => onItemTapped(0),
                    child: Icon(Icons.view_quilt, size: 25, color: selectedIndex == 0 ? Colors.white : ThemeColor.grayPrimary1,)
                  ),
                  GestureDetector(
                    onTap: () => onItemTapped(1),
                    child: Icon(Icons.search, size: 25, color: selectedIndex == 1 ? Colors.white : ThemeColor.grayPrimary1,)
                  ),
                  GestureDetector(
                    onTap: () => onItemTapped(2),
                    child: Icon(Icons.library_music, size: 25, color: selectedIndex == 2 ? Colors.white : ThemeColor.grayPrimary1,)
                  ),
                  GestureDetector(
                    onTap: () => onItemTapped(3),
                    child: Icon(Icons.people, size: 25, color: selectedIndex == 3 ? Colors.white : ThemeColor.grayPrimary1,)
                  ),
                  GestureDetector(
                    onTap: () => onItemTapped(4),
                    child: PlaceholderNetworkImage(
                      url: 'https://lh3.googleusercontent.com/proxy/xwyY0Rv0HhTaj49_ul1e1qgc0g6VgdsKci0NDd2FQfpyyXMAAyhrsm5gLj1gqpdjIjCLAKGAq8wIEgousKvxi_ZCQHSOiWi9JCBTd2HyrsMB67pdiR87zIZE11MIdhi1CovVxSHq2bk',
                      size: Size(25, 25),
                      borderRadius: 25/2,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
