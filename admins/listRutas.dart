import 'package:flutter/material.dart';

class ListRuta extends StatefulWidget {
  const ListRuta({super.key});

  @override
  State<ListRuta> createState() => _ListRutaState();
}

class _ListRutaState extends State<ListRuta> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.5),
            child: Text(
              "En Ruta",
              style: TextStyle(fontSize: 26.5),
            ),
          ),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data"),
          Text("data")
        ],
      ),
    );
  }
}
