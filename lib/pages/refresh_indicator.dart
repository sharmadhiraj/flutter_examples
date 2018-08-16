import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwipeToRefreshExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeToRefreshState();
  }
}

class _SwipeToRefreshState extends State<SwipeToRefreshExample> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  User user = User("Default User",
      "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg");

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe To Refresh"),
        actions: <Widget>[
          new IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              }),
        ],
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.network(user.image, height: 128.0, width: 128.0),
                    SizedBox(height: 24.0),
                    Text(user.name),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  Future<User> getUser() async {
    final response = await http.get("https://randomuser.me/api/");
    final responseJson = json.decode(response.body);
    return User.fromJson(responseJson);
  }

  Future<Null> _refresh() {
    return getUser().then((_user) {
      setState(() => user = _user);
    });
  }
}

class User {
  final String name, image;

  User(this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    json = json['results'][0];
    String name = json['name']['first'] + " " + json['name']['last'];
    String image = json['picture']['large'];
    return User(name, image);
  }
}
