import 'dart:convert'; // ✅ AGREGADO: para decodificar JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // ✅ AGREGADO: para hacer peticiones HTTP

class ListRuta extends StatefulWidget {
  const ListRuta({super.key});

  @override
  State<ListRuta> createState() => _ListRutaState();
}

class _ListRutaState extends State<ListRuta> {
  Map<String, dynamic>? ficha; // ✅ AGREGADO: almacena los datos de la ficha

  @override
  void initState() {
    super.initState();
    fetchFicha('F-01').then((data) { // ✅ AGREGADO: llama a la API
      setState(() {
        ficha = data;
      });
    }).catchError((e) {
      print("❌ Error: $e");
    });
  }

  

  Future<Map<String, dynamic>> fetchFicha(String fichaId) async { // ✅ AGREGADO: función para llamar la API
    final url = Uri.parse('http://192.168.100.26:4000/api/fichas/$fichaId'); // ✅ AGREGADO: cambia IP si usas dispositivo físico
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body); // ✅ AGREGADO
    } else {
      throw Exception('Ficha no encontrada');
    }
  }
  

  @override
  Widget build(BuildContext context) {
    if (ficha == null) { // ✅ AGREGADO: muestra loading si los datos aún no han llegado
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.5),
            child: Text(
              "En Ruta",
              style: TextStyle(fontSize: 26.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( // 🔁 MODIFICADO: ahora muestra el nombre y ficha desde la API
                  "${ficha!['ficha']} - ${ficha!['name']}", // ✅ AGREGADO
                  style: const TextStyle(fontSize: 24.5),
                ),
                const SizedBox(height: 10), // ✅ AGREGADO
                ...List.generate(ficha!['schools'].length, (index) { // ✅ AGREGADO: genera lista de escuelas
                  final escuela = ficha!['schools'][index];
                  return ListTile(
                    leading: const Icon(Icons.local_shipping_outlined),
                    title: Text(escuela['institute']),
                    subtitle: Text("Cantidad: ${escuela['amount']} Unidades"),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}