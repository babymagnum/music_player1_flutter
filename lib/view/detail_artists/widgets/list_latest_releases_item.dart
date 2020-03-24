import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:flutter/material.dart';

class ListLatestReleasesItem extends StatelessWidget {

  ListLatestReleasesItem({Key key, this.image, this.isLast, this.isFirst}): super(key: key);

  final String image;
  final bool isLast;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: ParentStyle()..margin(left: isFirst ? 20 : 0, right: isLast ? 20 : 9, bottom: 20),
      child: PlaceholderNetworkImage(
        url: image,
        size: Size(MediaQuery.of(context).size.width * 0.4, 200),
        borderRadius: 7,
        isFill: false
      ),
    );
  }
}
