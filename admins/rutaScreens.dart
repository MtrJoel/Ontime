import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:super_hero_app/admins/infoSuper.dart';
import 'package:super_hero_app/admins/listRutas.dart';

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
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("En ruta"),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],
      )),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            InfoSuper(),
            SizedBox(height: 30.5,),
            ListRuta()
          ],
        ),
      )
    );
  }
}
