import 'package:flutter/material.dart';

class ExpansionTilesExample extends StatelessWidget {
  const ExpansionTilesExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return StuffInTiles(listOfTiles[index]);
        },
        itemCount: listOfTiles.length,
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;

  const StuffInTiles(this.myTile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty) return ListTile(title: Text(t.title));
    return ExpansionTile(
      key: PageStorageKey<MyTile>(t),
      title: Text(t.title),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;

  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  MyTile('Animals', <MyTile>[
    MyTile('Dogs', <MyTile>[MyTile('dog one '), MyTile('dog two')])
  ])
];
