import 'package:flutter/material.dart';

import 'package:hangman_game_selfmade/question_page.dart';
import 'package:hangman_game_selfmade/result.dart';

void main() {
  runApp(HangmanGame());
}

class HangmanGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/game': (context) => GamePage(),
        '/result': (context) => ResultPage(
            ModalRoute.of(context)?.settings.arguments as ResultArguments),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int wordLength = 3;
  int totalQuestions = 5;
  int maxTries = 5;

  void goToGamePage() {
    Navigator.pushNamed(
      context,
      '/game',
      arguments: GameArguments(wordLength, totalQuestions, maxTries),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wordLength = 3;
                    });
                  },
                  child: const Text('3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wordLength = 6;
                    });
                  },
                  child: const Text('6'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      wordLength = 9;
                    });
                  },
                  child: const Text('9'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Total Questions: $totalQuestions'),
            Slider(
              min: 1,
              max: 10,
              value: totalQuestions.toDouble(),
              onChanged: (value) {
                setState(() {
                  totalQuestions = value.toInt();
                });
              },
            ),
            Text('Max Tries: $maxTries'),
            Slider(
              min: 1,
              max: 10,
              value: maxTries.toDouble(),
              onChanged: (value) {
                setState(() {
                  maxTries = value.toInt();
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: goToGamePage,
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
