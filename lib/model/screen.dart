import 'package:flutter/material.dart';

class Screen {
  final String title;
  final String subtitle;
  final Widget widget;

  String avatar() => title[0];

  Screen(this.title, this.subtitle, this.widget);
}
