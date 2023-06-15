import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:zubaid/falcons.dart';

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

class KitsPage extends StatefulWidget {
  final User? user;

  const KitsPage({Key? key, this.user}) : super(key: key);

  @override
  _KitsPageState createState() => _KitsPageState();
}

class _KitsPageState extends State<KitsPage> {
  final ref = FirebaseDatabase.instance.reference().child('perdictions');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perdictions"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            dynamic value = snapshot.value;

            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 15, 36, 73),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      value?['perdiction']?.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 15, 36, 73),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            value?['team1']?.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
                          ),
                        ),
                        const SizedBox(width: 120.0),
                        Expanded(
                          child: Text(
                            value?['team2']?.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Slider(
                    value: value?['percentage']?.toDouble() ?? 0.0,
                    min: 0.0,
                    max: 100.0,
                    onChanged: (double newValue) {
                      // Handle slider value change
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Percentage: ${(value?['percentage']?.toDouble() ?? 0.0).toStringAsFixed(2)}%',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
