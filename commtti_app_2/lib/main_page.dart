import 'package:commtti_app_2/user_view.dart';
import 'package:flutter/material.dart';

import 'committe_member.dart';
import 'drawer.dart';

Widget buildDecoratedContainer(String text, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDecoratedContainer(
              'Users & Admin',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserViewPage()),
                );
              },
            ),
            const SizedBox(height: 16),
            buildDecoratedContainer(
              'Committe Member',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommitteeMemberViewPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
