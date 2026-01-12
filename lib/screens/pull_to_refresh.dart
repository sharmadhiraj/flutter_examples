import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SwipeToRefreshExample extends StatefulWidget {
  const SwipeToRefreshExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SwipeToRefreshState();
  }
}

class _SwipeToRefreshState extends State<SwipeToRefreshExample> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  User user = User(
    "Default User",
    "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder-300-grey.jpg",
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _refreshIndicatorKey.currentState?.show());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swipe To Refresh"),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              onPressed: () => _refreshIndicatorKey.currentState?.show()),
        ],
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Image.network(user.image, height: 128, width: 128),
                    const SizedBox(height: 24),
                    Text(user.name),
                  ],
                ),
              ),
            )
          ])),
    );
  }

  Future<User> getUser() async {
    final http.Response response =
        await http.get(Uri.parse("https://randomuser.me/api/"));
    final dynamic responseJson = json.decode(response.body);
    return User.fromJson(responseJson);
  }

  Future<Null> _refresh() {
    return getUser().then((user) {
      setState(() => user = user);
    });
  }
}

class User {
  final String name;
  final String image;

  User(this.name, this.image);

  factory User.fromJson(Map<String, dynamic> json) {
    json = json["results"][0];
    final String name = "${json['name']['first']} ${json['name']['last']}";
    final String image = json['picture']['large'];
    return User(name, image);
  }
}
