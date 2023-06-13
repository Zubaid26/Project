import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchPrediction {
  final String team1;
  final String team2;
  final String prediction;
  final double percentage;

  MatchPrediction({
    required this.team1,
    required this.team2,
    required this.prediction,
    required this.percentage,
  });
}

class MatchPredictionListPage extends StatelessWidget {
  final ref = FirebaseDatabase.instance.ref().child('perdiction');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Predictions'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('predictions').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          final List<MatchPrediction> predictions =
              snapshot.data!.docs.map((doc) {
            final value = doc.data() as Map<String, dynamic>;
            return MatchPrediction(
              team1: value['team1'],
              team2: value['team2'],
              prediction: value['prediction'],
              percentage: value['percentage'].toDouble(),
            );
          }).toList();

          return ListView.builder(
            itemCount: predictions.length,
            itemBuilder: (BuildContext context, int index) {
              final prediction = predictions[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${prediction.team1} vs ${prediction.team2}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Prediction: ${prediction.prediction}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      'Percentage: ${prediction.percentage.toStringAsFixed(2)}%',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
