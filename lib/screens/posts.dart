import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final http.Response response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

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

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

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
  const NetworkCall({super.key});

  @override
  State<StatefulWidget> createState() {
    return NetworkCallState();
  }
}

class NetworkCallState extends State<NetworkCall> {
  Post? _post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: _fetchPost,
              child: const Text('Call'),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: _post == null ? null : Text(_post!.title),
            )
          ],
        ),
      ),
    );
  }

  void _fetchPost() {
    fetchPost().then((post) {
      _post = post;
      setState(() {});
    });
  }
}
