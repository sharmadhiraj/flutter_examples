import 'package:flutter/material.dart';

class Screen {
  final String title;
  final Widget widget;

  String avatar() => title[0];

  Screen(this.title, this.widget);
}
