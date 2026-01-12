import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("G.C. - WEATHER"),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
      body: ListView(
        children: <Widget>[
          FutureBuilder<List<Post>>(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Post> posts = snapshot.data ?? [];
                return Column(
                    children: posts
                        .map((post) => Column(
                              children: <Widget>[
                                Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(post.temperature),
                                )),
                              ],
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(snapshot.error.toString()),
                ));
              }
              return const Center(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(50)),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Future<List<Post>> fetchPosts() async {
  final http.Response response = await http.get(Uri.parse(
      'http://ws1.metcheck.com/ENGINE/v9_0/json.asp?lat=28&lon=-15.6&lid=62228&Fc=No'));
  final dynamic responseJson = json.decode(response.body);
  return (responseJson['metcheckData']['forecastLocation']['forecast'] as List)
      .map((p) => Post.fromJson(p))
      .toList();
}

class Post {
  final String temperature;
  final String rain;
  final String humidity;
  final String sunrise;
  final String sunset;
  final String updateDate;

  Post({
    required this.temperature,
    required this.rain,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.updateDate,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      temperature: json['temperature'].toString(),
      rain: json['rain'].toString(),
      humidity: json['humidity'].toString(),
      sunrise: json['sunrise'].toString(),
      sunset: json['sunset'].toString(),
      updateDate: json['utcTime'].toString(),
    );
  }
}
