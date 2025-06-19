import 'package:flutter/material.dart';
import 'package:super_hero_app/admins/rutaScreens.dart';
import 'package:super_hero_app/services/authservices.dart';
import 'package:super_hero_app/users/userscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void login() async {
    setState(() => isLoading = true);
    final role = await AuthService()
        .login(emailController.text, passwordController.text);
    setState(() => isLoading = false);

    if (role == 'admin') {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (_) => const Rutascreens()), (routes) => false);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const Rutascreens()));
    } else if (role == 'user') {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const UserScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Credenciales inválidas')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Iniciar Sesion", style: TextStyle(fontSize: 35.2)),
            SizedBox(height: 25.5),
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: login, child: const Text('Ingresar')),
          ],
        ),
      ),
    );
  }
}
