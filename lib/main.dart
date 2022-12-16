import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_flutter/pages/auth_page.dart';
import 'package:firebase_auth_flutter/pages/login_widget.dart';
import 'package:firebase_auth_flutter/pages/signup_widget.dart';
import 'package:firebase_auth_flutter/pages/verify_email_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot){
          if(snapshot.hasData){
            return const VerifyEmailPage();
          }
          else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
