import 'package:flutter/material.dart';

class ShopOverviewPage extends StatelessWidget {
  const ShopOverviewPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Overview'),
      ),
      body: Center(child: const Text('Hallo Guys')),
    );
  }
}
