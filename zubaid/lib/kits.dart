import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:zubaid/falcons.dart';

// ignore: camel_case_types
class kits extends StatefulWidget {
  final User? user;

  const kits({Key? key, this.user}) : super(key: key);

  @override
  State<kits> createState() => _StadiumState();
}

class _StadiumState extends State<kits> {
  final ref = FirebaseDatabase.instance.ref().child('kit');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kits"),
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
                      value?['team']?.toString() ?? '',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 15, 36, 73),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Image.network(
                          value?['home'] ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Image.network(
                          value?['away'] ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Expanded(
                          child: Text(
                            value?['team1']?.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Center(
                        child: Expanded(
                          child: Text(
                            value?['team2']?.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
                          ),
                        ),
                      ),
                    ],
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
