import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examples/model/user.dart';
import 'package:flutter_examples/util/method.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveCustomObjectExampleScreen extends StatefulWidget {
  const SaveCustomObjectExampleScreen({super.key});

  @override
  State<SaveCustomObjectExampleScreen> createState() =>
      _SaveCustomObjectExampleScreenState();
}

class _SaveCustomObjectExampleScreenState
    extends State<SaveCustomObjectExampleScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUser().then((value) => setState(() => _user = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Save Custom Object Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildUser(),
          if (_user == null)
            ElevatedButton(
              onPressed: () {
                _saveUser();
                navigate(
                  context,
                  const SaveCustomObjectExampleScreen(),
                  finish: true,
                );
              },
              child: const Text("Save User"),
            )
          else
            ElevatedButton(
              onPressed: () {
                _deleteUser();
                navigate(
                  context,
                  const SaveCustomObjectExampleScreen(),
                  finish: true,
                );
              },
              child: const Text("Delete User"),
            )
        ],
      ),
    );
  }

  Widget _buildUser() {
    if (_user == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text("No user saved"),
        ),
      );
    } else {
      return Column(
        children: [
          ListTile(
            title: const Text("Name"),
            subtitle: Text(_user!.name),
          ),
          ListTile(
            title: const Text("Email"),
            subtitle: Text(_user!.email),
          ),
          ListTile(
            title: const Text("Address"),
            subtitle: Text(_user!.address),
          ),
        ],
      );
    }
  }

  Future<void> _saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final User user = User("Aaron", "aaron@gmail.com", "Wales");
    await prefs.setString('user', json.encode(user.toJson()));
  }

  Future<User?> _getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("user")) {
      return User.fromJson(json.decode(prefs.getString("user")!));
    }
    return null;
  }

  Future<void> _deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }
}
