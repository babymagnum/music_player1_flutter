import 'package:flutter/material.dart';

class SongsView extends StatefulWidget {
  @override
  _SongsViewState createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Songs'),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
