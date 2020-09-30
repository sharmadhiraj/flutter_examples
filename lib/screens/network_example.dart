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
  Future<Item> _futureItem;

  Future<Item> getItem() async {
    final response = await http.get(
        "https://jsonplaceholder.typicode.com/photos/${Random().nextInt(5000)}");
    final responseJson = json.decode(response.body);
    return Item.fromJson(responseJson);
  }

  @override
  void initState() {
    super.initState();
    _futureItem = getItem();
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
                  ? snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              snapshot.data.image,
                              width: 160,
                              height: 160,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                snapshot.data.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            RaisedButton(
                              onPressed: () =>
                                  setState(() => _futureItem = getItem()),
                              child: Text("Another"),
                            )
                          ],
                        )
                      : InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Text("ERROR OCCURRED, Tap to retry !"),
                          ),
                          onTap: () => setState(() => _futureItem = getItem()))
                  : CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Item {
  final String title, image;

  Item(this.title, this.image);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['title'], json['thumbnailUrl']);
  }
}
