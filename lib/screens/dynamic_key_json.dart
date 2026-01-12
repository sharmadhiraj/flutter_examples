/* Json sample
{
  "91": {
    "email": "george.bluth@reqres.in",
    "first_name": "George"
  },
  "22": {
    "email": "janet.weaver@reqres.in",
    "first_name": "Janet"
  },
  "31": {
    "email": "emma.wong@reqres.in",
    "first_name": "Emma"
  },
  "34": {
    "email": "eve.holt@reqres.in",
    "first_name": "Eve"
  },
  "53": {
    "email": "charles.morris@reqres.in",
    "first_name": "Charles"
  },
  "61": {
    "email": "tracey.ramos@reqres.in",
    "first_name": "Tracey"
  },
  "47": {
    "email": "michael.lawson@reqres.in",
    "first_name": "Michael"
  },
  "28": {
    "email": "lindsay.ferguson@reqres.in",
    "first_name": "Lindsay"
  }
}
*/

import 'dart:convert';

import 'package:flutter/material.dart';

String jsonData =
    '{ "91": { "email": "george.bluth@reqres.in", "first_name": "George" }, "22": { "email": "janet.weaver@reqres.in", "first_name": "Janet" }, "31": { "email": "emma.wong@reqres.in", "first_name": "Emma" }, "34": { "email": "eve.holt@reqres.in", "first_name": "Eve" }, "53": { "email": "charles.morris@reqres.in", "first_name": "Charles" }, "61": { "email": "tracey.ramos@reqres.in", "first_name": "Tracey" }, "47": { "email": "michael.lawson@reqres.in", "first_name": "Michael" }, "28": { "email": "lindsay.ferguson@reqres.in", "first_name": "Lindsay" } }';

class User {
  final String id;
  final String name;
  final String email;

  User(this.id, this.name, this.email);

  static List<User> parseList(Map<String, dynamic> map) {
    final List<User> users = [];
    map.forEach((key, value) {
      users.add(User(key, value["first_name"], value["email"]));
    });
    return users;
  }
}

class DynamicKeyJsonExampleScreen extends StatelessWidget {
  const DynamicKeyJsonExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Key Json"),
      ),
      body: ListView(
        children: User.parseList(json.decode(jsonData))
            .map((i) => Card(
                  child: ListTile(
                    title: Text(i.name),
                    subtitle: Text(i.email),
                    leading: CircleAvatar(child: Text(i.id)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
