import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoPageView();
  }
}

class _VideoPageView extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("VideoPage"),
      ),
    );
  }
}
