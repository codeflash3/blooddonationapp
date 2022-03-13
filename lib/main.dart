import 'package:blood_donation/DBTabs/delete_donor_entry.dart';
import 'package:blood_donation/DBTabs/drequests.dart';
import 'package:blood_donation/DBTabs/searchblood.dart';
import 'package:blood_donation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:blood_donation/screens/register_screen.dart';
import 'package:blood_donation/screens/welcome_screen.dart';
import 'package:blood_donation/screens/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DBTabs/infoentry.dart';
import 'DBTabs/donorinfoentry.dart';
import 'DBTabs/drequests.dart';
import 'DBTabs/receivertab.dart';
import 'DBTabs/faqs.dart';
import 'DBTabs/deleteentry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        Dashboard.id: (context) => const Dashboard(),
        InfoEntry.id: (context) => const InfoEntry(),
        DinfoEntry.id: (context) => const DinfoEntry(),
        Drequests.id: (context) => Drequests(),
        Rrequests.id: (context) => Rrequests(),
        DeleteEntru.id: (context) => const DeleteEntru(),
        CloudFirestoreSearch.id: (context) => CloudFirestoreSearch(),
        Deletedonor.id: (context) => const Deletedonor(),
        Searchblood.id: (context) => Searchblood(),
      },
    );
  }
}
