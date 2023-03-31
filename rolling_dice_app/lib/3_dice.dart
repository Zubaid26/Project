

// ignore_for_file: file_names

import 'dart:math';
import 'package:flutter/material.dart';



class DicePage3 extends StatefulWidget {
  const DicePage3({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DicePage3State createState() => _DicePage3State();
}

class _DicePage3State extends State<DicePage3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _dice1 = 1;
  int _dice2 = 1;
  int _dice3 = 1;

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
      _dice2 = Random().nextInt(6) + 1;
      _dice3 = Random().nextInt(6) + 1;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rolling Dice'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AnimatedBuilder(
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
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value * pi,
                        child: Image.asset(
                          'images/dice$_dice2.png',
                          height: 150,
                          width: 150,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _animation.value * pi,
                        child: Image.asset(
                          'images/dice$_dice3.png',
                          height: 150,
                          width: 150,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: _rollDice,
              child: const Text('Roll the Dice!'),
            ),
          ],
        ),
      ),
    );
  }
}
