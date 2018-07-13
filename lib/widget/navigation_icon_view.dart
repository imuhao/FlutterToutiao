import 'package:flutter/material.dart';

class NavigationIconView {
  BottomNavigationBarItem item;
  final AnimationController controller;

  NavigationIconView(Widget txt, Widget icon, TickerProvider vstnc)
      : item = BottomNavigationBarItem(title: txt, icon: icon),
        controller = new AnimationController(
            vsync: vstnc, duration: kThemeAnimationDuration);

}
