import 'package:flutter_toutiao/widget/navigation_icon_view.dart';
import 'package:flutter/material.dart';
import 'global_config.dart';
import 'video/video.dart';
import 'money/money.dart';
import 'news/news.dart';
import 'home/home.dart';

void main() => runApp(new TouTiaoApp());

class TouTiaoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "玩赚头条",
      theme: GlobalConfig.theme,
      home: TouTiaoHomePage(),
    );
  }
}

class TouTiaoHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TouTiaoHomeView();
  }
}

class _TouTiaoHomeView extends State<TouTiaoHomePage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(Text("新闻"), Icon(Icons.assignment), this),
      NavigationIconView(Text("视频"), Icon(Icons.slow_motion_video), this),
      NavigationIconView(Text("赚钱"), Icon(Icons.attach_money), this),
      NavigationIconView(Text("我的"), Icon(Icons.home), this)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: getBottomNavigation(),
    );
  }

  getBottomNavigation() {
    return BottomNavigationBar(
      items:
          _navigationViews.map((NavigationIconView item) => item.item).toList(),
      currentIndex: _currentIndex,
      fixedColor: GlobalConfig.color,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _navigationViews[index].controller.reverse();
          _currentIndex = index;
          _navigationViews[index].controller.forward();
        });
      },
    );
  }

  _getBody() {
    return IndexedStack(
      children: <Widget>[
        NewsPage(),
        VideoPage(),
        MoneyPage(),
        HomePage(),
      ],
      index: _currentIndex,
    );
  }
}
