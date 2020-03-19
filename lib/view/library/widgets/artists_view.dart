import 'package:flutter/material.dart';

class ArtistsView extends StatefulWidget {
  @override
  _ArtistsViewState createState() => _ArtistsViewState();
}

class _ArtistsViewState extends State<ArtistsView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Artists'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
