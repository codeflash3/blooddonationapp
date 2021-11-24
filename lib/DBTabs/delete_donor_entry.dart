import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blood_donation/screens/dashboard.dart';

class deletedonor extends StatefulWidget {
  const deletedonor({Key? key}) : super(key: key);
  static String id = 'deleteDentry';

  @override
  _deletedonorState createState() => _deletedonorState();
}

class _deletedonorState extends State<deletedonor> {
  late String docId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Delete Donor Entry',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, Dashboard.id);
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'To remove your request go to particular request tab,search for your request and copy unique code assigned to your request.Paste the same code below',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Enter your Unique ID here',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 19.0,
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.redAccent, width: 1),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Delete',
                    ),
                    onPressed: () async {
                      showAlertDialog(context);
                      final collection =
                          await FirebaseFirestore.instance.collection('dinfo');
                      collection
                          .doc(docId) // <-- Doc ID to be deleted.
                          .delete() // <-- Delete
                          .then((_) => print('Deleted'))
                          .catchError(
                              (error) => print('Delete failed: $error'));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text(
      'Go to Dashboard',
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.redAccent,
      ),
    ),
    onPressed: () {
      Navigator.pushNamed(context, Dashboard.id);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text('Thank You'),
    content: const Text('Your request has been Deleted.'),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
