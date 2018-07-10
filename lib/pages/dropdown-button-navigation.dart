import 'package:flutter/material.dart';

class DropDownButtonScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropDownButtonScreenState();
  }
}

class _DropDownButtonScreenState extends State<DropDownButtonScreen> {
  String ddValue;

  @override
  void initState() {
    super.initState();
    ddValue = "MEN";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButtonHideUnderline(
          child: new DropdownButton(
            value: ddValue, //Default value
            items: <DropdownMenuItem>[
              new DropdownMenuItem(
                value: "MEN",
                child: new Text('MEN'),
              ),
              new DropdownMenuItem(
                value: "WOMEN",
                child: new Text('WOMEN'),
              ),
            ],
            onChanged: (v) {
              ddValue = v;
              setState(() {});
            },
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (ddValue == "MEN") {
      return Center(child: Text("Widget for men"));
    } else if (ddValue == "WOMEN") {
      return Center(child: Text("Widget for Women"));
    }
    return Center(child: Text("Widget not found"));
  }
}
