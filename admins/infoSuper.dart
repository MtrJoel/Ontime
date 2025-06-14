import 'package:flutter/material.dart';

class InfoSuper extends StatefulWidget {
  const InfoSuper({super.key});

  @override
  State<InfoSuper> createState() => _InfoSuperState();
}

class _InfoSuperState extends State<InfoSuper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 15.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.blueAccent,
            child: Text("JM"),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "Joel Montero",
            style: TextStyle(fontSize: 26),
          ),
        ],
      ),
    );
  }
}
