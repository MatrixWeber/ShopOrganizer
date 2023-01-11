import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Name',
                  // border: OutlineInputBorder(),
                  // labelText: 'Email',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Email',
                  // border: OutlineInputBorder(),
                  // labelText: 'Email',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Phone',
                  // border: OutlineInputBorder(),
                  // labelText: 'Email',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Password',
                  // border: OutlineInputBorder(),
                  // labelText: 'Email',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Confirm Password',
                  // border: OutlineInputBorder(),
                  // labelText: 'Email',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
