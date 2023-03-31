import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());
//Run file

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

 void PlaySound(int SoundNumber){
    final player = AudioCache();
    player.play('note$SoundNumber.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Xylophone App'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    PlaySound(1);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    PlaySound(2);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    PlaySound(3);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    PlaySound(4);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.blue;
                    }),
                  ),
                  onPressed: () {
                    PlaySound(5);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    PlaySound(6);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    PlaySound(7);
                  },
                  child: const Text(''),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    PlaySound(7);
                  },
                  child: const Text(''),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
