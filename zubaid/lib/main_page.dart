import 'package:flutter/material.dart';
import 'package:zubaid/stadiums.dart';
import 'package:zubaid/teams.dart';
import 'package:zubaid/test.dart';
import 'package:zubaid/winners.dart';
import 'channel.dart';
import 'drawer.dart';
import 'falcons.dart';
import 'kits.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final int index;
  final Function onTap;
  @override
// ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final User? user;
  Widget _buildContainer(
      String title, String image, int containerIndex, Widget page) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 1, color: const Color.fromARGB(255, 15, 36, 73))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 15, 36, 73),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NFL 2023",
        ),
        elevation: 10.0,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  _buildContainer(
                    'Draft',
                    'assets/group.png',
                    1,
                    MatchStatisticsScreen(),
                  ),
                  const SizedBox(width: 30),
                  _buildContainer(
                    'Teams',
                    'assets/group.png',
                    2,
                    Teams(
                      myCardData: const [],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  _buildContainer(
                    'Stadiums',
                    'assets/stadium.png',
                    3,
                    const stadium(),
                  ),
                  const SizedBox(width: 30),
                  _buildContainer(
                    'Squads',
                    'assets/kits.png',
                    4,
                    const UserListPage(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  _buildContainer(
                    'TV Channels',
                    'assets/channel.png',
                    5,
                    const brodcasters(),
                  ),
                  const SizedBox(width: 30),
                  _buildContainer(
                    'Prev Winners',
                    'assets/stadium.png',
                    6,
                    const winners(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  _buildContainer(
                    'kits',
                    'assets/stadium.png',
                    3,
                    const kits(),
                  ),
                  const SizedBox(width: 30),
                  _buildContainer(
                    'News',
                    'assets/kits.png',
                    4,
                    const NewsScreen(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
