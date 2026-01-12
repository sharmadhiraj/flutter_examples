import 'package:flutter/material.dart';

class DialogExampleScreen extends StatelessWidget {
  const DialogExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bodyProgress = Container(
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(2),
      ),
      width: 300,
      height: 200,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const Center(
              child: Text(
                "Signing up...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Dialog")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Show"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                content: bodyProgress,
              ),
            );
          },
        ),
      ),
    );
  }
}
