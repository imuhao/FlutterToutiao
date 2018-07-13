import 'package:flutter/material.dart';

class MoneyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoneyPageView();
  }
}

class _MoneyPageView extends State<MoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MoneyPage"),
      ),
    );
  }
}
