import 'package:flutter/material.dart';

class ResultArguments {
  final int totalQuestions;
  final int correctAnswers;

  ResultArguments(this.totalQuestions, this.correctAnswers);
}

class ResultPage extends StatelessWidget {
  ResultPage(ResultArguments arguments);

  @override
  Widget build(BuildContext context) {
    final ResultArguments args =
        ModalRoute.of(context)?.settings.arguments as ResultArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Questions: ${args.totalQuestions}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Correct Answers: ${args.correctAnswers}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
