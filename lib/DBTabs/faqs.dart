import 'package:blood_donation/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudFirestoreSearch extends StatefulWidget {
  static String id = 'search';
  // bool equalsIgnoreCase(String a, String b) =>
  //     (a == null && b == null) ||
  //     (a != null && b != null && a.toLowerCase() == b.toLowerCase());
  @override
  _CloudFirestoreSearch createState() => _CloudFirestoreSearch();
}

class _CloudFirestoreSearch extends State<CloudFirestoreSearch> {
  String name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, Dashboard.id);
              }),
          backgroundColor: Colors.redAccent,
          title: TextFormField(onChanged: (val) {
            setState(() {
              name = val;
            });

            const Text('Search Here');
          }),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: name != ""
              ? FirebaseFirestore.instance
                  .collection('dinfo')
                  //.where('blood', isGreaterThanOrEqualTo: name)
                  .where('city', isGreaterThanOrEqualTo: name)

                  //.where('city', arrayContains: name)
                  .snapshots()
              : FirebaseFirestore.instance.collection("dinfo").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
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
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }

  void initiateSearch(String val) {
    setState(() {
      name = val.toLowerCase().trim();
    });
  }
}
