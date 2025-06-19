import 'package:flutter/material.dart';

class DetalleRutaScreen extends StatelessWidget {
  final Map<String, dynamic> ficha;

  const DetalleRutaScreen({super.key, required this.ficha});

  @override
  Widget build(BuildContext context) {
    final schools = ficha['schools'] as List<dynamic>?;

    return Scaffold(
      appBar: AppBar(title: Text("Ruta ${ficha['ficha']}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nombre: ${ficha['name']}", style: const TextStyle(fontSize: 20)),
            Text("Localidad: ${ficha['location']}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            const Text("Escuelas asignadas:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            if (schools != null && schools.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: schools.length,
                  itemBuilder: (context, index) {
                    final school = schools[index];
                    return ListTile(
                      leading: const Icon(Icons.school_outlined),
                      title: Text(school['institute']),
                      subtitle: Text("Cantidad de leche: ${school['amount']} unidades"),
                    );
                  },
                ),
              )
            else
              const Text("No hay escuelas asignadas"),
          ],
        ),
      ),
    );
  }
}
