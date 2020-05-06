import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class NetworkCall extends StatefulWidget {
  NetworkCall();

  @override
  State<StatefulWidget> createState() {
    return NetworkCallState();
  }
}

class NetworkCallState extends State<NetworkCall> {
  void _fetchPost() {
    fetchPost().then((post) {
      _post = post;
      setState(() {});
    });
  }

  Post _post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: RaisedButton(
                child: Text('Call'),
                onPressed: () {
                  _fetchPost();
                },
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16),
                child: _post == null ? null : Text(_post.title))
          ],
        ),
      ),
    );
  }
}
