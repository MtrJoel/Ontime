import 'package:flutter/material.dart';
import 'package:super_hero_app/admins/rutaScreens.dart';
import 'package:super_hero_app/services/authservices.dart';
import 'package:super_hero_app/services/loginscreen.dart';
import 'package:super_hero_app/users/userscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnTime App',
      home: FutureBuilder<String?>(
        future: AuthService().getRole(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final role = snapshot.data;
            if (role == 'admin') return const Rutascreens();
            if (role == 'user') return const UserScreen();
          }
          return const LoginScreen();
        },
      ),
    );
  }
}
