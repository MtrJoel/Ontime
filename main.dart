import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screens(),
    );
  }
}

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Supervisor"),
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
          ),
          SizedBox(height: 20.25),
          ElevatedButton(
            onPressed: () {}, 
            child: Text("Chofer"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(200, 50)
            ),
          )
        ],
      ),
    ));
  }
}
