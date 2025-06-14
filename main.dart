import 'package:flutter/material.dart';
import 'package:super_hero_app/admins/rutaScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selección de Rol',
      initialRoute: '/',
      routes: {
        '/': (context) => const Screens(),
        '/admin': (context) => Rutascreens(),
      },
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
            onPressed: () {
              Navigator.pushNamed(context, '/admin');
            },
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            child: Text("Supervisor"),
          ),
          SizedBox(height: 20.25),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
            child: Text("Chofer"),
          )
        ],
      ),
    ));
  }
}
