import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hangman_game_selfmade/result.dart';

class GameArguments {
  final int wordLength;
  final int totalQuestions;
  final int maxTries;

  GameArguments(this.wordLength, this.totalQuestions, this.maxTries);
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> questions = [];
  int currentQuestionIndex = 0;
  late int triesLeft;
  late String currentQuestionWord;
  List<String> options = [];
  late String correctAnswer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final GameArguments args =
        ModalRoute.of(context)?.settings.arguments as GameArguments;
    generateQuestions(args.wordLength, args.totalQuestions);
    triesLeft = args.maxTries;
    loadNextQuestion();
  }

  void generateQuestions(int wordLength, int totalQuestions) {
    // Generate random words as questions
    for (int i = 0; i < totalQuestions; i++) {
      final word = generateRandomWord(wordLength);
      questions.add(word);
    }
  }

  String generateRandomWord(int length) {
    String alphabet = 'abcdefghijklmnopqrstuvwxyz';
    final random = Random();
    String word = '';
    for (int i = 0; i < length; i++) {
      final charIndex = random.nextInt(alphabet.length);
      word += alphabet[charIndex];
    }
    return word;
  }

  void loadNextQuestion() {
    if (currentQuestionIndex < questions.length) {
      currentQuestionWord = questions[currentQuestionIndex];
      options = generateOptions(currentQuestionWord);
      correctAnswer = options[0];
    } else {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: ResultArguments(questions.length, currentQuestionIndex),
      );
    }
  }

  List<String> generateOptions(String correctAnswer) {
    List<String> options = [correctAnswer];
    while (options.length < 3) {
      final word = generateRandomWord(correctAnswer.length);
      if (!options.contains(word)) {
        options.add(word);
      }
    }
    options.shuffle();
    return options;
  }

  void checkAnswer(String selectedOption) {
    if (selectedOption == correctAnswer) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Correct!'),
            content: const Text('You gave the correct answer.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  loadNextQuestion();
                },
                child: const Text('Next Question'),
              ),
            ],
          );
        },
      );
    } else {
      triesLeft--;
      if (triesLeft == 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Incorrect'),
              content: Column(
                children: [
                  const Text('You gave the incorrect answer.'),
                  Text('Correct Answer: $correctAnswer'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    loadNextQuestion();
                  },
                  child: const Text('Next Question'),
                ),
              ],
            );
          },
        );
      }
    }
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
            Text(
              'Question ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Guess the word:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              currentQuestionWord,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Options:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Column(
              children: options
                  .map(
                    (option) => ElevatedButton(
                      onPressed: () {
                        checkAnswer(option);
                      },
                      child: Text(option),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
