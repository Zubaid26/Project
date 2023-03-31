import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key, required this.name, required this.email});
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.amber),
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Zubaid Rasool",
                textScaleFactor: 1.2,
              ),
              accountEmail: Text(
                "zubaidr26@gmail.com",
                textScaleFactor: 1.2,
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("images/drawerpic.jpg")),
            ),
          ),
          // ignore: prefer_const_constructors
          ListTile(
            leading: const Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: const Text(
              "Home",
              textScaleFactor: 1.3,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
            ),
            title: const Text(
              'About',
              textScaleFactor: 1.3,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // ignore: todo
              // TODO: Navigate to About page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              textScaleFactor: 1.3,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // ignore: todo
              // TODO: Navigate to Settings page
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.white,
            ),
            title: const Text(
              'Help',
              textScaleFactor: 1.3,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // ignore: todo
              // TODO: Navigate to Help page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'Name: $name',
              textScaleFactor: 1.2,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            title: Text(
              'Email: $email',
              textScaleFactor: 1.2,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.star,
                color: Colors.white,
                
              ),
              Icon(
                Icons.share,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Icon(
                Icons.rate_review,
                color: Colors.white,
              ),
              Icon(
                Icons.settings_backup_restore,
                color: Colors.white,
              ),
              Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
