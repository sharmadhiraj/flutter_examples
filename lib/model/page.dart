import 'package:flutter/material.dart';

class Page {
  final String title;
  final Widget widget;

  String avatar() => title[0];

  Page(this.title, this.widget);
}
