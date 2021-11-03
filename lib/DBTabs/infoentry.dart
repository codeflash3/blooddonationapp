import 'package:blood_donation/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InfoEntry extends StatefulWidget {
  const InfoEntry({Key? key}) : super(key: key);
  static String id = 'infoentry';
  @override
  _InfoEntryState createState() => _InfoEntryState();
}

class _InfoEntryState extends State<InfoEntry> {
  late String name;
  late String city;
  late String bloodgrp;
  late String urgency;
  late String contact;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 22.0,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Enter your Information',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (value) {
                  name = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  // hintText: 'Enter your name',
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 19.0,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (value) {
                  city = value;
                },
                decoration: const InputDecoration(
                  labelText: 'City name',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  // hintText: 'City Name',
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 19.0,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (value) {
                  bloodgrp = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Blood Group',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  // hintText: 'Urgency of Blood(Urgent/Not Urgent)',
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 19.0,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.redAccent,
                ),
                onChanged: (value) {
                  urgency = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Urgency(Urgent/not Urgent)',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  // hintText: 'Blood Group',
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 19.0,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextField(
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (value) {
                  contact = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Contact no.',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 19.0,
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent, width: 1),
                  ),
                  // hintText: 'Contact no.',
                  // hintStyle: TextStyle(
                  //   color: Colors.grey,
                  //   fontSize: 19.0,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextButton(
                onPressed: () {
                  showAlertDialog(context);
                  _firestore.collection('info').add({
                    'blood': bloodgrp,
                    'city': city,
                    'contact': contact,
                    'name': name,
                    'urgency': urgency,
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text(
                  'Send Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
    content:
        const Text('Your request has been queued. Wait for Donor`s response.'),
    actions: [okButton],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
