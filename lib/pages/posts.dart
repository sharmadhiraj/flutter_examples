import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
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

class FirstFragment extends StatefulWidget {
  FirstFragment(this.usertype, this.username);

  final String usertype;
  final String username;

  @override
  State<StatefulWidget> createState() {
    return FirstFragmentState();
  }
}

class FirstFragmentState extends State<FirstFragment> {
  void _fetchPost() {
    fetchPost().then((post) {
      _post = post;
      setState(() {});
    });
  }

  Post _post;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: new SingleChildScrollView(
        padding: new EdgeInsets.all(5.0),
        child: new Padding(
          padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new RaisedButton(
                  child: new Text('Call'),
                  onPressed: () {
                    _fetchPost();
                  },
                ),
              ),
              new Container(child: _post == null ? null : Text(_post.title))
            ],
          ),
        ),
      ),
    );
  }
}
