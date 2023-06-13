import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Color selectedColor = Colors.transparent; // Default color
  Color color = Colors.transparent; // Color for the ColorPicker

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Builder(
        builder: (BuildContext context) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: selectedColor,
                ),
                padding: const EdgeInsets.all(0),
                child: Center(
                  child: UserAccountsDrawerHeader(
                    accountName: const Text(
                      'NFL',
                      style: TextStyle(color: Colors.black),
                    ),
                    accountEmail: const Text(
                      'nfl2023@gmail.com',
                      style: TextStyle(color: Colors.black),
                    ),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage('assets/nfl.png'),
                    ),
                    decoration: BoxDecoration(
                      color: selectedColor,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to home screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.circle),
                title: const Text('Themes'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Select a color'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: color,
                            onColorChanged: (Color pickedColor) {
                              Navigator.pop(context);
                              setState(() {
                                selectedColor = pickedColor;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to favorites screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text('Share'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to favorites screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Review'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to favorites screen
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to settings screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigate to about screen
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help'),
                onTap: () {
                  // Navigate to help page
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Drawer Example')),
      drawer: const MyDrawer(),
    ),
  ));
}
