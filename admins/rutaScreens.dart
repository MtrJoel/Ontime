import 'package:flutter/material.dart';
import 'package:super_hero_app/admins/infoSuper.dart';
import 'package:super_hero_app/admins/listRutas.dart';
import 'package:super_hero_app/services/loginscreen.dart';
class Rutascreens extends StatefulWidget {
  const Rutascreens({super.key});

  @override
  State<Rutascreens> createState() => _RutascreensState();
}

class _RutascreensState extends State<Rutascreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            InfoSuper(),
            SizedBox(height: 30.5),
            ListRuta(),
          ],
        ),
      ),
    );
  }
}
