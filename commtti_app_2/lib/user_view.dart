import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserViewPage extends StatefulWidget {
  UserViewPage({Key? key}) : super(key: key);

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
  TextEditingController durationController = TextEditingController();
  TextEditingController memberNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController committeeNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController membersController = TextEditingController();
  TextEditingController memberEmailController = TextEditingController();
  TextEditingController memberPasswordController = TextEditingController();
  TextEditingController notificationMessageController = TextEditingController();

  String _duration = '';

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase
    Firebase.initializeApp();
  }

  Future<void> _createCommittee() async {
    try {
      String committeeName = committeeNameController.text;
      String amount = amountController.text;
      String duration = durationController.text;
      String members = membersController.text;

      if (committeeName.isEmpty ||
          amount.isEmpty ||
          duration.isEmpty ||
          members.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please fill in all the fields.'),
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
        // TODO: Perform Firebase Firestore operations to create committee
        // You can use _firestore.collection('committees').add({...}) to add a new document to the 'committees' collection
        // Remember to handle success and error cases with appropriate dialog boxes

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Committee created successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    committeeNameController.clear();
                    amountController.clear();
                    durationController.clear();
                    membersController.clear();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to create committee: $e'),
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

  Future<void> _addCommitteeMember() async {
    try {
      String memberName = memberNameController.text;
      String phoneNumber = phoneNumberController.text;
      String email = emailController.text;

      if (memberName.isEmpty || phoneNumber.isEmpty || email.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please fill in all the fields.'),
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
        // TODO: Perform Firebase Firestore operations to add committee member
        // You can use _firestore.collection('members').add({...}) to add a new document to the 'members' collection
        // Remember to handle success and error cases with appropriate dialog boxes

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('Committee member added successfully.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    memberNameController.clear();
                    phoneNumberController.clear();
                    emailController.clear();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to add committee member: $e'),
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildCommitteemember() {
    return Column(
      children: [
        TextFormField(
          controller: memberNameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: phoneNumberController,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: _addCommitteeMember,
          child: const Text('Add Committee Member'),
        ),
      ],
    );
  }

  Widget _buildCommitteeForm() {
    return Column(
      children: [
        TextFormField(
          controller: committeeNameController,
          decoration: const InputDecoration(
            labelText: 'Committee Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: amountController,
          decoration: const InputDecoration(
            labelText: 'Amount',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: durationController,
          decoration: const InputDecoration(
            labelText: 'Duration',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: membersController,
          decoration: const InputDecoration(
            labelText: 'Members',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: _createCommittee,
          child: const Text('Create Committee'),
        ),
      ],
    );
  }

  Widget _buildMemberList() {
    // TODO: Implement member list UI
    return Container();
  }

  Widget _buildShareCredentials() {
    return Column(
      children: [
        TextFormField(
          controller: memberEmailController,
          decoration: const InputDecoration(
            labelText: 'Member Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: memberPasswordController,
          decoration: const InputDecoration(
            labelText: 'Member Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Success'),
                  content:
                      const Text('Share Credentials successfully To Members.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog

                        memberEmailController.clear();
                        memberPasswordController.clear();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Share Credentials'),
        ),
      ],
    );
  }

  Widget _buildNotificationForm() {
    return Column(
      children: [
        TextFormField(
          controller: notificationMessageController,
          decoration: const InputDecoration(
            labelText: 'Notification Message',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement send notification functionality
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

                        notificationMessageController.clear();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Send Notification'),
        ),
        ElevatedButton(
          onPressed: () {
            // TODO: Implement send notification functionality
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Submit all data successfully.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        memberNameController.clear();
                        phoneNumberController.clear();
                        emailController.clear();
                        committeeNameController.clear();
                        amountController.clear();
                        durationController.clear();
                        membersController.clear();
                        memberEmailController.clear();
                        memberPasswordController.clear();
                        notificationMessageController.clear();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Text(' Submit all Data '),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User View'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Create Committee'),
          _buildCommitteeForm(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Add Committee Members'),
          _buildCommitteemember(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Manage Members'),
          _buildMemberList(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Share Login Credentials'),
          _buildShareCredentials(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Send Notifications'),
          _buildNotificationForm(),
        ],
      ),
    );
  }
}
