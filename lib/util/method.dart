import 'package:flutter/material.dart';

void navigate(BuildContext context, Widget widget, {bool finish = false}) {
  if (finish) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
