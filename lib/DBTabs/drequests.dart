import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class Drequests extends StatefulWidget {
  static String id = 'd_requests';
  @override
  _DrequestsState createState() => _DrequestsState();
}

class _DrequestsState extends State<Drequests> {
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
          'Donor Requests',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: RequestStream(),
      ),
    );
  }
}

class RequestStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('dinfo').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    border: Border.all(color: Colors.redAccent, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 5.0,
                      ),
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
                      Container(
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'Copy your Unique ID',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(
                                  ClipboardData(text: document.id),
                                );
                              },
                              icon: const Icon(
                                Icons.copy,
                                size: 20.0,
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
