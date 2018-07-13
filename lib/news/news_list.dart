import 'package:flutter/material.dart';
import 'package:flutter_toutiao/widget/refresh_page.dart';
import 'package:flutter_toutiao/global_config.dart';

class NewsListPage extends StatefulWidget {
  String _tabName;

  NewsListPage(this._tabName);

  @override
  State<StatefulWidget> createState() {
    return _NewsListPageView(_tabName);
  }
}

class _NewsListPageView extends State<NewsListPage> {
  String _tabName;

  _NewsListPageView(this._tabName);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView.builder(itemCount: 10, itemBuilder: _generateItem),
      onRefresh: () async {
//        await;
        print("refresh");
      },
    );
  }

  Widget _generateItem(BuildContext context, int position) {
    //onl text Layout
    return Container(
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.topStart,
            height: 49.0,
            child: Text(
              "哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              maxLines: 2,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.red,
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 2.0, bottom: 2.0),
                child: Text(
                  "置顶",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 40.0)),
              Baseline(
                baseline: 18.0,
                baselineType: TextBaseline.ideographic,
                child: Text(
                  "12345人看过",
                  style: TextStyle(
                      textBaseline: TextBaseline.ideographic,
                      color: Colors.grey,
                      fontSize: 11.0),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
