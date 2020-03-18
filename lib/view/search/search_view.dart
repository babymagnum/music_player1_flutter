import 'package:division/division.dart';
import 'package:dribbble_clone/model/trending_artists.dart';
import 'package:dribbble_clone/view/search/widgets/list_trending_artists_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_text_style.dart';
import '../../core/theme/theme_text_style.dart';
import '../../core/theme/theme_text_style.dart';

class SearchView extends StatelessWidget {
  
  List<TrendingArtists> _listTrending = [
    TrendingArtists('Jbalvin', 'http://los40cr00.epimg.net/los40/imagenes/2019/09/20/estilo40/1568986399_675600_1568986979_noticia_normal.jpg'),
    TrendingArtists('Aya Nakamura', 'https://www.somagnews.com/wp-content/uploads/2019/10/24-e1570731591362-696x356.jpg'),
    TrendingArtists('Tyga', 'https://images.complex.com/complex/images/c_fill,dpr_auto,q_90,w_920/fl_lossy,pg_1/a0rppp8bocgbzwdpv8m6/tyga-getty-nicholas-hunt'),
    TrendingArtists('Lizzo', 'https://img.texasmonthly.com/2020/01/lizzo-by-the-numbers.jpg?auto=compress&crop=faces&fit=fit&fm=jpg&h=0&ixlib=php-1.2.1&q=45&w=600'),
    TrendingArtists('Rosalia', 'https://dmn-dallas-news-prod.cdn.arcpublishing.com/resizer/Q-3Q905xZhF_KgnZYmZ97pTqF6s=/1660x934/smart/filters:no_upscale()/arc-anglerfish-arc2-prod-dmn.s3.amazonaws.com/public/6UEL6GM2PVL42XU3YOSV2MEC7E.jpg'),
    TrendingArtists('Harry Styles', 'http://25.media.tumblr.com/2f7f1a27d8715753cb74ce2f5176cc07/tumblr_mqcn6agEOB1rnr2hyo1_250.jpg'),
  ];
  List<String> _listCategories = ['Pop', 'Love Songs', 'Rock Ballads', 'Funkie', 'J-Pop', 'Reggaeton', 'R&B', 'Workout', 'K-Pop', 'Kroncong', 'Koplo'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).padding.top + 20,),
            Parent(
              style: ParentStyle()..background.color(ThemeColor.grey.withOpacity(0.15))..borderRadius(all: 10)..margin(horizontal: 20),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  Icon(Icons.search, color: ThemeColor.input_color, size: 20,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      style: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: -3, color: ThemeColor.input_color),
                      decoration: InputDecoration(
                        hintText: 'Try "Latin Songs"',
                        hintStyle: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: -3, color: ThemeColor.input_color),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(width: 1, height: 30, color: ThemeColor.input_color,),
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Icon(Icons.sort, color: ThemeColor.input_color, size: 20,)
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Text('Trending Artists', style: ThemeTextStyle.ubuntuM.apply(color: ThemeColor.whiteGray, fontSizeDelta: -2),),
                SizedBox(width: 7,),
                Parent(
                  style: ParentStyle()..height(15)..width(15)..borderRadius(all: 15/2)..background.color(ThemeColor.grey.withOpacity(0.15)),
                  child: Center(
                    child: Icon(Icons.keyboard_arrow_right, size: 12, color: ThemeColor.input_color,),
                  ),
                )
              ],
            ),
            GridView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTrendingArtistsItem(item: _listTrending[index]),
              itemCount: _listTrending.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.05),
            ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                Text('Categories', style: ThemeTextStyle.ubuntuM.apply(color: ThemeColor.whiteGray, fontSizeDelta: -2),),
                SizedBox(width: 7,),
                Parent(
                  style: ParentStyle()..height(15)..width(15)..borderRadius(all: 15/2)..background.color(ThemeColor.grey.withOpacity(0.15)),
                  child: Center(
                    child: Icon(Icons.keyboard_arrow_right, size: 12, color: ThemeColor.input_color,),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 5,
                runSpacing: -10,
                children: List<Widget>.generate(_listCategories.length, (int index) => Chip(
                  label: Text(_listCategories[index], style: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: -2),),
                ),
                ).toList(),
                direction: Axis.horizontal,
              ),
            ),
            SizedBox(height: 75,)
          ],
        ),
      ),
    );
  }
}
