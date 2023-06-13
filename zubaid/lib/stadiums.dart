import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class stadium extends StatefulWidget {
  const stadium({Key? key});

  @override
  State<stadium> createState() => _WinnersState();
}

class _WinnersState extends State<stadium> {
  final ref = FirebaseDatabase.instance.ref().child('stadium');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stadiums"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: FirebaseAnimatedList(
          query: ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            dynamic value = snapshot.value;

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(
                          value?['image'] ?? '',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            value?['text']?.toString() ?? '',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
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
    );
  }
}
