import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logging/logging.dart';

class Pesquisa extends StatefulWidget {
  const Pesquisa({Key? key}) : super(key: key);

  @override
  _PesquisaState createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final TextEditingController controller = TextEditingController();
  final Logger logger = Logger('PesquisaLogger');
  String resultado = '';

  Future<void> inserirResultado(String texto) async {
    final url = Uri.parse('http://10.0.2.2:5000/inserirTexto'); // Ajuste para o emulador Android

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'texto': texto}),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        logger.info('Resultado inserido com sucesso: ${responseData['id']}');
      } else {
        logger.warning('Falha ao inserir resultado. Status code: ${response.statusCode}');
      }
    } catch (error) {
      logger.severe('Erro ao fazer a requisição: $error');
    }
  }

Future<void> buscarResultado(BuildContext context) async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:5000/resultado'),
    );

    if (response.statusCode == 200) {
      // Decodifica a resposta para um mapa (objeto JSON)
      Map<String, dynamic> responseData = jsonDecode(response.body);

      // Verifica se o mapa possui as chaves esperadas
      if (responseData.containsKey('id') && responseData.containsKey('resultado')) {
        setState(() {
          resultado = responseData['resultado'];
        });
      } else {
        _showDialog(context, 'Formato de resposta inválido.');
      }
    } else {
      _showDialog(context, 'Falha ao buscar resultados: ${response.reasonPhrase}');
    }
  } catch (error) {
    _showDialog(context, 'Erro ao fazer a requisição: $error');
  }
}
  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCA054D),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 37.0,
            left: 20.0,
            child: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () {
                // Implementar ação desejada
              },
            ),
          ),
          Positioned(
            top: 110.0,
            child: Column(
              children: [
                const Text(
                  'Verificar Informação',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: 330.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Digite aqui',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            width: 290.0,
            height: 55.0,
            top: 480.0,
            child: ElevatedButton(
              onPressed: () {
                final texto = controller.text;
                if (texto.isNotEmpty) {
                  inserirResultado(texto);
                } else {
                  _showDialog(context, 'Digite um texto para inserir.');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B1C32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Verifact!',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            width: 290.0,
            height: 55.0,
            top: 545.0,
            child: ElevatedButton(
              onPressed: () {
                buscarResultado(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3B1C32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Pegar',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 600.0,
            child: Text(
              'RESULTADO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
  top: 650.0, // Ajuste conforme necessário para evitar sobreposições
  child: Text(
    resultado.isNotEmpty ? resultado : 'Nenhum resultado encontrado.',
    style: const TextStyle(
      color: Colors.white,
      fontSize: 19.0,
      fontWeight: FontWeight.bold,
    ),
  ),
),

        ],
      ),
    );
  }
}
