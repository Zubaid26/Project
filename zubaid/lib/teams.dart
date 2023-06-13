import 'package:flutter/material.dart';
import 'package:zubaid/stadiums.dart';

class Teams extends StatefulWidget {
  final List<Map<String, dynamic>> myCardData;
  final int? index;

  Teams({Key? key, required this.myCardData, this.index}) : super(key: key);

  @override
  State<Teams> createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.index != null && widget.index! < widget.myCardData.length) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.myCardData[widget.index!]['page'],
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 15, 36, 73),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 15, 36, 73),
                  width: 1.0,
                ),
              ),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(
                  widget.index != null
                      ? widget.myCardData[widget.index!]['image']
                      : '',
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.index != null
                        ? widget.myCardData[widget.index!]['title']
                        : '',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 15, 36, 73),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> myCardData = [
    {
      'image': 'assets/atlanta_falcons.png',
      'title': 'Atlanta \n Falcons',
      'page': const stadium(),
    },
    {
      'image': 'assets/atlanta_falcons.png',
      'title': 'Atlanta \n Falcons',
      'page': const stadium(),
    },
    // Rest of the data...
  ];

  MyHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: Column(
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
                    'AFC Teams',
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
                    'NFC Teams',
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
            child: ListView.builder(
              itemCount: (myCardData.length / 2).ceil() * 2,
              itemBuilder: (BuildContext context, int index) {
                if (index >= myCardData.length) {
                  return const SizedBox();
                }
                int startIndex = index;
                int endIndex = startIndex + 1;
                List<Widget> rowChildren = [];
                for (int i = startIndex; i < endIndex; i++) {
                  if (i < myCardData.length) {
                    rowChildren.add(
                      Expanded(
                        child: Teams(myCardData: myCardData, index: i),
                      ),
                    );
                  } else {
                    rowChildren.add(
                      const Expanded(
                        child: SizedBox(),
                      ),
                    );
                  }
                }
                return Row(children: rowChildren);
              },
            ),
          ),
        ],
      ),
    );
  }
}
