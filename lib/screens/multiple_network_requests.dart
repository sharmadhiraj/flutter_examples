import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsDashboard extends StatefulWidget {
  const NewsDashboard({Key? key}) : super(key: key);

  @override
  _NewsDashboardState createState() => _NewsDashboardState();
}

class _NewsDashboardState extends State<NewsDashboard> {
  final String apiKey = "aa67d8d98c8e4ad1b4f16dbd5f3be348";
  late Future<List<List<News>>> _futureNews;

  @override
  void initState() {
    super.initState();
    _futureNews = getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Dashboard"),
      ),
      body: FutureBuilder<List<List<News>>>(
        future: _futureNews,
        builder:
            (BuildContext context, AsyncSnapshot<List<List<News>>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData && snapshot.data != null
                  ? ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Top Headlines",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                snapshot.data![0].map(getNewsListItem).toList(),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Everything",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 160,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children:
                                snapshot.data![1].map(getNewsListItem).toList(),
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32),
                          child: Text("Something went wrong, Tap to retry !"),
                        ),
                      ),
                      onTap: () => setState(() => _futureNews = getNews()),
                    )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget getNewsListItem(News news) {
    return Card(
      elevation: 2,
      child: SizedBox(
        width: 240,
        child: Stack(
          children: [
            Image.network(
              news.image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration:
                      const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    news.title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<List<News>>> getNews() async {
    final List<List<News>> news = [
      await getTopHeadlines(),
      await getEverything()
    ];
    return news;
  }

  Future<List<News>> getTopHeadlines() async {
    final String url =
        "https://newsapi.org/v2/top-headlines?category=technology&apiKey=$apiKey";
    final http.Response response = await http.get(Uri.parse(url));
    return News.parseBody(json.decode(response.body));
  }

  Future<List<News>> getEverything() async {
    final String url =
        "https://newsapi.org/v2/everything?q=technology&apiKey=$apiKey";
    final http.Response response = await http.get(Uri.parse(url));
    return News.parseBody(json.decode(response.body));
  }
}

class News {
  final String title;
  final String image;

  News(this.title, this.image);

  factory News.fromJson(Map<String, dynamic> json) {
    return News(json["title"], json["urlToImage"]);
  }

  static List<News> parseBody(Map<String, dynamic> body) {
    return (body["articles"] as List<dynamic>)
        .map((i) => News.fromJson(i))
        .toList();
  }
}
