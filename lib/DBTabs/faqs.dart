// import 'package:flutter/material.dart';
// import 'package:expandable/expandable.dart';

// class FAQ extends StatefulWidget {
//   const FAQ({Key? key}) : super(key: key);
//   static String id = 'faq';

//   @override
//   _FAQState createState() => _FAQState();
// }

// class _FAQState extends State<FAQ> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FAQS'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ExpandablePanel(
//               header: const Text('This is a header'),
//               collapsed: const Text(
//                 'article-body',
//                 softWrap: true,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               expanded: const Text(
//                 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum vlorem ipsum lorem ipsum lorem ipsum lorem ipsum',
//                 softWrap: true,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CloudFirestoreSearch extends StatefulWidget {
//   static String id = 'search';
//   @override
//   _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
// }

// class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
//   String? searchKey;
//   late Stream streamQuery;
//   final _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: Card(
//           child: TextFormField(
//             onFieldSubmitted: (value) {
//               setState(() async {
//                 searchKey = value;
//                 streamQuery = _firestore
//                     .collection('dinfo')
//                     .where('city', isGreaterThanOrEqualTo: searchKey)
//                     .where('city', isLessThanOrEqualTo: searchKey)
//                     .where('city')
//                     .snapshots();
//                 print(
//                   'length=' + streamQuery.length.toString(),
//                 );
//               });
//               //_firestore
//             },
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('dinfo').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return Container(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2.0),
//                     border: Border.all(color: Colors.redAccent, width: 2),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       const SizedBox(
//                         height: 5.0,
//                       ),
//                       Container(
//                         child: Row(
//                           children: <Widget>[
//                             const Text(
//                               'Donors Name :',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 60.0,
//                             ),
//                             Text(
//                               document['name'],
//                               style: const TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             const Text(
//                               'City :',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 135.0,
//                             ),
//                             Text(
//                               document['city'],
//                               style: const TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             const Text(
//                               'Blood Grp :',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 89.0,
//                             ),
//                             Text(
//                               document['blood'],
//                               style: const TextStyle(
//                                 color: Colors.redAccent,
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: [
//                             const Text(
//                               'Contact no. :',
//                               style: TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 77.0,
//                             ),
//                             Text(
//                               document['contact'],
//                               style: const TextStyle(
//                                 fontSize: 17.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Row(
//                           children: <Widget>[
//                             const Text(
//                               'Copy your Unique ID',
//                               style: TextStyle(
//                                 fontSize: 15.0,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 Clipboard.setData(
//                                   ClipboardData(text: document.id),
//                                 );
//                               },
//                               icon: const Icon(
//                                 Icons.copy,
//                                 size: 20.0,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:blood_donation/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CloudFirestoreSearch extends StatefulWidget {
  static String id = 'search';
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
          }),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: name != ""
              ? FirebaseFirestore.instance
                  .collection('dinfo')
                  .where('city', isEqualTo: name)
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
