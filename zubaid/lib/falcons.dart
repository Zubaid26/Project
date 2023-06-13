import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'kits.dart';

class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> data = jsonData['data'];
        setState(() {
          users = data.map((userJson) => User.fromJson(userJson)).toList();
        });
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void navigateToNextPage(User user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => kits(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                navigateToNextPage(user);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.avatar),
              ),
            ),
            title: GestureDetector(
              onTap: () {
                navigateToNextPage(user);
              },
              child: Text('${user.firstName} ${user.lastName}'),
            ),
            subtitle: GestureDetector(
              onTap: () {
                navigateToNextPage(user);
              },
              child: Text(user.email),
            ),
          );
        },
      ),
    );
  }
}
