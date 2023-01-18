import 'package:flutter/material.dart';
import 'package:shop_organizer/shop_overview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop Orginizer',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Authentication'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerPassword = TextEditingController();
  final _controllerEmail = TextEditingController();
  String _error = '';
  Color _color = Colors.black;

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  Future<void> _createUserWithEmailAndPassword(
      bool registrationWasPressed) async {
    try {
      if (registrationWasPressed) {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
        );
        print(
            'user was registered successfully ${credential.user!.uid.toString()}');
      } else {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _controllerEmail.text,
          password: _controllerPassword.text,
        );
        if (credential.user!.uid.isNotEmpty) {
          // FirebaseAuth.instance.currentUser?.uid
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ShopOverviewPage()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        setState(() {
          _error = e.message.toString();
          _color = Colors.red;
        });
        print(e.message);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Log In or create Account',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const Padding(padding: EdgeInsets.all(20.0)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  key: const Key('EmailKey'),
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(50.0),
                    // ),
                    hintText: 'max.mustermann@example.de',
                    // border: OutlineInputBorder(),
                    // labelText: 'Email',
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10.0)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  key: const Key('PasswordKey'),
                  controller: _controllerPassword,
                  obscureText: true,
                  decoration: const InputDecoration(
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(50.0),
                    // ),
                    hintText: 'password',
                    // border: OutlineInputBorder(),
                    // labelText: 'Passwort',
                  ),
                ),
              ),
              if (_error.isNotEmpty == true)
                Text(_error, style: TextStyle(fontSize: 16, color: _color)),
              const Padding(padding: EdgeInsets.all(10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    key: const Key('LoginButton'),
                    onPressed: () => _createUserWithEmailAndPassword(false),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const RegisterPage()),
                        // );
                        _createUserWithEmailAndPassword(true),
                    child: const Text(
                      "Resister",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
