import 'package:flutter/material.dart';

import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zubaid Rasool',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            scaffoldBackgroundColor: const Color.fromARGB(255, 248, 245, 246)),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter1() {
    setState(() {
      _counter++;
    });
  }

  void _zerostart() {
    setState(() {
      _counter = 0;
    });
  }

  void _incrementCounter3() {
    setState(() {
      _counter += 3;
    });
  }

  void _decrementCounter1() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Counter Application")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 201,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/zubi.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  _incrementCounter3();

                  const message = SnackBar(
                    content: Text(
                      "Increment By 3",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Increment By 3",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _incrementCounter1();
                  const message = SnackBar(
                    content: Text(
                      "Increment By 1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Increment By 1",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _zerostart();
                  const message = SnackBar(
                    content: Text(
                      "Start From Zero",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Start From 0",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _decrementCounter1();
                  const message = SnackBar(
                    content: Text(
                      "Deccrement By 1",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(message);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        "Decrement By 1",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
