import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/trending_artists.dart';
import 'package:dribbble_clone/view/detail_artists/detail_artists_view.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/theme_text_style.dart';

class ListTrendingArtistsItem extends StatelessWidget {

  ListTrendingArtistsItem({Key key, this.item}): super(key: key);

  final TrendingArtists item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailArtistsView())),
      child: Column(
        children: <Widget>[
          PlaceholderNetworkImage(
            isFill: false,
            url: item.image, size: Size(80, 80), borderRadius: 40,
          ),
          SizedBox(height: 10),
          Text(item.name, style: ThemeTextStyle.ubuntuR.apply(color: Colors.white, fontSizeDelta: -4),)
        ],
      ),
    );
  }
}
