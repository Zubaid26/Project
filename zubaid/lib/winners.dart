import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class winners extends StatefulWidget {
  const winners({Key? key});

  @override
  State<winners> createState() => _BroadcastersState();
}

class _BroadcastersState extends State<winners> {
  final ref = FirebaseDatabase.instance.ref().child('winners');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Winners"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: const Color.fromARGB(255, 15, 36, 73),
                        width: 1.0,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Years',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 36, 73),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Winners',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 36, 73),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Score',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 36, 73),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  DataSnapshot dataSnapshot = snapshot as DataSnapshot;
                  dynamic value = dataSnapshot.value;

                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: const Color.fromARGB(255, 15, 36, 73),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                value['years'].toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 15, 36, 73),
                                ),
                              ),
                              Text(
                                value['win'].toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 15, 36, 73),
                                ),
                              ),
                              Text(
                                value['score'].toString(),
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 15, 36, 73),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
