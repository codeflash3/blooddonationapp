import 'package:blood_donation/DBTabs/drequests.dart';
import 'package:blood_donation/DBTabs/receivertab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'welcome_screen.dart';
import 'package:blood_donation/DBTabs/donorinfoentry.dart';
import 'package:blood_donation/DBTabs/infoentry.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static String id = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'FAQs',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamed(context, WelcomeScreen.id);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Drequests.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                height: 69.0,
                child: const Center(
                  child: Text(
                    'Donor requests',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Rrequests.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                height: 69.0,
                child: const Center(
                  child: Text(
                    'Receivers requests',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, DinfoEntry.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                height: 69.0,
                child: const Center(
                  child: Text(
                    'Volunteer as Donor',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, InfoEntry.id);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                height: 69.0,
                child: const Center(
                  child: Text(
                    'Request for Blood',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
