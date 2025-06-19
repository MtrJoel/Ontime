import 'package:flutter/material.dart';
import 'package:super_hero_app/services/authservices.dart';
import 'package:super_hero_app/services/loginscreen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  void logout(BuildContext context) async {
    await AuthService().logout();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuario'),
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: Text('Pantalla de usuario 😎')),
    );
  }
}