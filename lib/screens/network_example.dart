import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkExampleScreen extends StatefulWidget {
  const NetworkExampleScreen({super.key});

  @override
  State<NetworkExampleScreen> createState() => _NetworkExampleScreenState();
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
      appBar: AppBar(title: const Text("Network Example")),
      body: Center(
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                setState(() => _futureItem = _getItem()),
                            child: const Text("Another"),
                          )
                        ],
                      )
                    : InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(32),
                          child: Text("ERROR OCCURRED, Tap to retry !"),
                        ),
                        onTap: () => setState(() => _futureItem = _getItem()),
                      )
                : const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Item> _getItem() async {
    final http.Response response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/photos/${Random().nextInt(5000)}"));
    final dynamic responseJson = json.decode(response.body);
    return Item.fromJson(responseJson);
  }
}

class Item {
  final String title;
  final String image;

  Item(this.title, this.image);

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(json['title'], json['thumbnailUrl']);
  }
}
