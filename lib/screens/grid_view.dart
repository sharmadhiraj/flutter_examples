import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = [];
    for (int i = 1; i < 30; i++) {
      images.add("https://i.picsum.photos/id/${i * 20}/200/200.jpg");
    }

    final Widget gridSection = Expanded(
      child: GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          padding: const EdgeInsets.all(4),
          children: images.map((String url) {
            return GridTile(
              child: Card(
                child: Image.network(url, fit: BoxFit.cover),
              ),
            );
          }).toList()),
    );

    final Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[gridSection],
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Grid Example")),
      body: body,
    );
  }
}
