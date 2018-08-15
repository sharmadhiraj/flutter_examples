import 'package:flutter/material.dart';
import 'package:flutter_examples/util/method.dart';

class TestStateLessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestStateScreen();
  }
}

class TestStateScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListState();
  }
}

class _ListState extends State<TestStateScreen> {
  List<String> listItems = ["A", "B", "C", "D"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("A"),
        ),
        onTap: () {
          navigate(context, DetailScreen());
        },
      ),
//      body: ListView(
//          children: listItems
//              .map((i) => InkWell(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(i),
//                    ),
//                    onTap: () {
//                      navigate(context, DetailScreen());
//                    },
//                  ))
//              .toList()),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
    );
  }
}
