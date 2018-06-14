import 'package:flutter/material.dart';

import 'pages/list.dart';

void main() {
  // ignore: deprecated_member_use
  MaterialPageRoute.debugEnableFadingRoutes = true;
  runApp(MaterialApp(home: ListScreen()));
}
