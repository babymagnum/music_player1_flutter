import 'package:flutter/material.dart';

class AlbumsView extends StatefulWidget {
  @override
  _AlbumsViewState createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Album'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
