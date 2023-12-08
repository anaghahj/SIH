import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Icon(Icons.person_sharp),
          const SizedBox(height: 20),
          TextField(
            controller: username,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              prefixIcon: Icon(Icons.person_outline),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: password,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              labelText: 'Passwoed',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('If not registered.'),
              InkWell(
                child: const Text('Register Now'),
                onTap: () => launchUrlString('https://mines.gov.in/webportal/home'),
              ),
            ]
          ),
          
        ],
      ),
    );
  }
}
