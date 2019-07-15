import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfoScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserInfoState();
}

class UserInfoState extends State<UserInfoScreen> {
  Map user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    var response = await http.get('http://samplename.com/user/1');
    user = json.decode(response.body);
    print(user['UserId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('hi')));
  }
}
