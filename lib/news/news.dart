import 'package:flutter/material.dart';
import 'package:flutter_toutiao/global_config.dart';
import 'news_list.dart';
import 'dart:io';
import 'dart:convert';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _NewsPage();
  }
}

class _NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageView();
  }
}

class _NewsPageView extends State<_NewsPage> {
  List<Tab> tabs;
  List<String> tabTxts;
  int _currentIndex = 0;

  _getTabData() async {
    var client = HttpClient();
    var params = {
      "platform": "1",
      "curVer": "7",
      "chnl": "tencent",
      "devcId": "864630039488951",
      "cliTime": "1531473067504",
      "userId": "19043",
      "token": "9be25aaf8a409a6e2c126b44164fd9f6",
      "apiSign": "e7d2b7c9c6c77ce45c443bfe8438a2be",
    };
    var uri = Uri.http(GlobalConfig.BASE_URL, GlobalConfig.KIND_URL, params);
    var result;
    try {
      var request = await client.getUrl(uri);
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        result = JsonDecoder().convert(
            await response.transform(Utf8Codec().decoder).join())["result"];
      } else {
        result = "Error Code :${response.statusCode}";
        return;
      }
    } catch (exception) {
      result = "Filed " + exception.toString();
      return;
    }
    List myKinds = result["myKinds"];
    setState(() {
      for (var kind in myKinds) {
        tabTxts.add(kind["name"]);
      }
      tabs = _getTabs();
    });
  }

  @override
  void initState() {
    super.initState();
    tabTxts = [];
    tabs = [];
    _getTabData();
  }

  List<Tab> _getTabs() {
    List<Tab> tabs = [];
    for (String value in tabTxts) {
      tabs.add(Tab(
          child: Text(
        value,
      )));
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    if (tabs.length < 1) {
      return Text("正在加载...");
    }
    return DefaultTabController(
      length: tabs.length,
      initialIndex: _currentIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text("玩赚头条"),
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: tabTxts.map((String text) {
            return NewsListPage(text);
          }).toList(),
        ),
      ),
    );
  }
}
