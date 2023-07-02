import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CommitteeMemberViewPage extends StatefulWidget {
  CommitteeMemberViewPage({
    Key? key,
  }) : super(key: key);

  @override
  _CommitteeMemberViewPageState createState() =>
      _CommitteeMemberViewPageState();
}

class _CommitteeMemberViewPageState extends State<CommitteeMemberViewPage> {
  TextEditingController previousPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _changePassword() async {
    try {
      String previousPassword = previousPasswordController.text;
      String newPassword = newPasswordController.text;

      if (previousPassword.isEmpty || newPassword.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content:
                  const Text('Please enter both previous and new passwords.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        User? user = _auth.currentUser;

        if (user != null) {
          // Reauthenticate the user with their previous password
          AuthCredential credential = EmailAuthProvider.credential(
            email: user.email!,
            password: previousPassword,
          );
          await user.reauthenticateWithCredential(credential);

          // Change the password to the new one
          await user.updatePassword(newPassword);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text('Password changed successfully.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                      previousPasswordController.clear();
                      newPasswordController.clear();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to change password: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee Member View'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'Committee Details'),
                Tab(text: 'Notifications'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Change password',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: previousPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Previous Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          controller: newPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: _changePassword,
                          child: const Text('Change Password'),
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Committee details',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const ListTile(
                          leading: Icon(Icons.timer),
                          title: Text('Remaining Time'),
                          subtitle: Text(
                              '05 days'), // Use the _duration variable here
                        ),
                        const ListTile(
                          leading: Icon(Icons.person),
                          title: Text('Lucky Person for Next Committee'),
                          subtitle: Text('Zubaid Rasool'),
                        ),
                        const ListTile(
                          leading: Icon(Icons.list),
                          title: Text('Remaining Committees'),
                          subtitle: Text('9 out of 10'),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          'Notifications From User & Admin',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Lucky Draw will be after 05 days',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        // Implement notifications list here
                      ],
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
