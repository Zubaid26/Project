import 'dart:math';
import 'package:flutter/material.dart';

import '2_dice.dart';
import '3_dice.dart';
import '4_dice.dart';
import 'drawer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rolling Dice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:  XylophoneApp(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _dice1 = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rollDice() {
    setState(() {
      _dice1 = Random().nextInt(6) + 1;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rolling Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/drawerpic.jpg',
                        height: 100.0,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Card Title',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Card Description',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'Button',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value * pi,
                      child: Image.asset(
                        'images/dice$_dice1.png',
                        height: 150,
                        width: 150,
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _rollDice,
              child: const Text('Roll the Dice!'),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DicePage2()));
                      },
                      child: const Text("2 Dice"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DicePage3()));
                      },
                      child: const Text("3 Dice"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DicePage()));
                      },
                      child: const Text("4 Dice"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: const MyDrawer(
        email: 'zubaidr26@gmail.com',
        name: "Zubaid Rasool",
      ),
    );
  }
}
