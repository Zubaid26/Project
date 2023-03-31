import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final List<Color> _buttonColors = [    Colors.red,    Colors.orange,    Colors.yellow,    Colors.green,    Colors.teal,    Colors.blue,    Colors.purple,    Colors.pink,    Colors.brown,    Colors.grey,  ];

  final List<String> _buttonNotes = [    'note1.wav',    'note2.wav',    'note3.wav',    'note4.wav',    'note5.wav',    'note6.wav',    'note7.wav',    'note8.wav',    'note9.wav',    'note10.wav',  ];

  final AudioCache _audioCache = AudioCache();

  int _numButtons = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xylophone App'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _numButtons = int.tryParse(value) ?? 10;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Number of Buttons',
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _numButtons,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _buttonColors[index % _buttonColors.length],
                    ),
                    onPressed: () {
                      _audioCache.play(_buttonNotes[index % _buttonNotes.length]);
                    },
                    child: Text('Button ${index + 1}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


