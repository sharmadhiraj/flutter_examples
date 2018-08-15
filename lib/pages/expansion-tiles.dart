import 'package:flutter/material.dart';

class ExpansionTilesExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new StuffInTiles(listofTiles[index]);
        },
        itemCount: listofTiles.length,
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;

  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty) return new ListTile(title: new Text(t.title));
    return new ExpansionTile(
      key: new PageStorageKey<MyTile>(t),
      title: new Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listofTiles = <MyTile>[
  new MyTile('Animals', <MyTile>[
    new MyTile('Dogs', <MyTile>[new MyTile('dog one '), new MyTile('dog two')])
  ])
];
