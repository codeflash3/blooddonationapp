import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/painting.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class Rrequests extends StatefulWidget {
  static String id = 'r_requests';
  @override
  _RrequestsState createState() => _RrequestsState();
}

class _RrequestsState extends State<Rrequests> {
  // final _auth = FirebaseAuth.instance;

  @override
  // void initState() {
  //   super.initState();
  //
  //   getCurrentUser();
  // }

  // void getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
        title: const Text(
          'Receivers Requests',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: RrequestStream(),
      ),
    );
  }
}

class RrequestStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('info').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.redAccent, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'Donors Name :',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 60.0,
                            ),
                            Text(
                              document['name'],
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Text(
                              'City :',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 135.0,
                            ),
                            Text(
                              document['city'],
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'Urgency :',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 103.0,
                            ),
                            Text(
                              document['urgency'],
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Text(
                              'Blood Grp :',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 89.0,
                            ),
                            Text(
                              document['blood'],
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Text(
                              'Contact no. :',
                              style: TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                            const SizedBox(
                              width: 77.0,
                            ),
                            Text(
                              document['contact'],
                              style: const TextStyle(
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
