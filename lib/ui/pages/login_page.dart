import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('lib/ui/assets/logo.png'),
          Text('Login'.toUpperCase()),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
