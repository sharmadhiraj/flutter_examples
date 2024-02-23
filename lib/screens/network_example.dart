import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkExampleScreen extends StatefulWidget {
  @override
  _NetworkExampleScreenState createState() => _NetworkExampleScreenState();
}

class _NetworkExampleScreenState extends State<NetworkExampleScreen> {
  late Future<Item> _futureItem;

  @override
  void initState() {
    super.initState();
    _futureItem = _getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Network Example")),
      body: Center(
        child: Container(
          child: FutureBuilder<Item>(
            future: _futureItem,
            builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData && snapshot.data != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              snapshot.data!.image,
                              width: 160,
                              height: 160,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                snapshot.data!.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  setState(() => _futureItem = _getItem()),
                              child: Text("Another"),
                            )
                          ],
                        )
                      : InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text("ERROR OCCURRED, Tap to retry !"),
                          ),
                          onTap: () => setState(() => _futureItem = _getItem()),
                        )
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Future<Item> _getItem() async {
    final response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/photos/${Random().nextInt(5000)}"));
    final responseJson = json.decode(response.body);
    return Item.fromJson(responseJson);
  }
}

class Item {
  final String title, image;

  Item(this.title, this.image);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['title'], json['thumbnailUrl']);
  }
}
