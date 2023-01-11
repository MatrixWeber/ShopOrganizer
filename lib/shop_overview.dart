import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';

class ShopOverviewPage extends StatefulWidget {
  const ShopOverviewPage({super.key});

  @override
  State<ShopOverviewPage> createState() => _ShopOverviewPageState();
}

class _ShopOverviewPageState extends State<ShopOverviewPage> {
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyApp(),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Overview'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text('Hallo Guys'),
          ElevatedButton.icon(
            onPressed: _signOut,
            icon: const Icon(Icons.outbond),
            label: const Text('Logout'),
          ),
        ],
      )),
    );
  }
}
