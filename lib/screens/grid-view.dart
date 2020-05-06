import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> images = [];
    for (int i = 1; i < 30; i++) {
      images.add("https://i.picsum.photos/id/${i * 20}/200/200.jpg");
    }

    Widget gridSection = Expanded(
      flex: 1,
      child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1,
          shrinkWrap: true,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          padding: const EdgeInsets.all(4),
          children: images.map((String url) {
            return GridTile(
                child: Card(
              child: Image.network(url, fit: BoxFit.cover),
            ));
          }).toList()),
    );

    Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        gridSection,
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Example"),
      ),
      body: body,
    );
  }
}
