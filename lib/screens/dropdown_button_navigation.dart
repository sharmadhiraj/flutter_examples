import 'package:flutter/material.dart';

class DropDownButtonScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropDownButtonScreenState();
  }
}

class _DropDownButtonScreenState extends State<DropDownButtonScreen> {
  String? defaultValue;

  @override
  void initState() {
    super.initState();
    defaultValue = "MEN";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: defaultValue,
            items: <DropdownMenuItem<String>>[
              DropdownMenuItem(
                value: "MEN",
                child: Text('MEN'),
              ),
              DropdownMenuItem(
                value: "WOMEN",
                child: Text('WOMEN'),
              ),
            ],
            onChanged: (v) {
              defaultValue = v;
              setState(() {});
            },
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (defaultValue == "MEN") {
      return Center(child: Text("Widget for men"));
    } else if (defaultValue == "WOMEN") {
      return Center(child: Text("Widget for Women"));
    }
    return Center(child: Text("Widget not found"));
  }
}
