import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class brodcasters extends StatefulWidget {
  const brodcasters({Key? key});

  @override
  State<brodcasters> createState() => _BroadcastersState();
}

class _BroadcastersState extends State<brodcasters> {
  final ref = FirebaseDatabase.instance.ref().child('channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Broadcasters"),
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
                    child: const Text(
                      'Country',
                      style: TextStyle(
                        color: Color.fromARGB(255, 15, 36, 73),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
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
                    child: const Text(
                      'Network',
                      style: TextStyle(
                        color: Color.fromARGB(255, 15, 36, 73),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index) {
                  DataSnapshot dataSnapshot = snapshot;
                  dynamic value = dataSnapshot.value;

                  if (value == null) {
                    return const SizedBox();
                  }

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
                          child: Text(
                            value['country'].toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
                          ),
                        ),
                      ),
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
                          child: Text(
                            value['name'].toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Color.fromARGB(255, 15, 36, 73),
                            ),
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
