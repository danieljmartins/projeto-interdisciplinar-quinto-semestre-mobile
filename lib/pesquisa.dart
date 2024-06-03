import 'package:flutter/material.dart';

class Pesquisa extends StatelessWidget {
  const Pesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCA054D),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Cabeçalho
          Positioned(
            top: 37.0,
            left: 320.0,
            child: IconButton(
              icon: const Icon(Icons.menu),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () {
                // não faz nada, botão estático
              },
            ),
          ),
          Positioned(
            top: 110.0,
            child: Column(
              children: [
                // Título
                const Text(
                  'Verificar Informação',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),

                // Input
                Container(
                  width: 330.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
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

          // Botão
          Positioned(
            width: 290.0,
            height: 55.0,
            top: 480.0,
            child: ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Pesquisa()),
              ),
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

          // Texto abaixo do botão
          const Positioned(
            top: 550.0,
            child: Text(
              'RESULTADO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 603.0,
            child: Text(
              'A probabilidade é de que a notícia seja:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 655.0,
            child: Text(
              'Verdadeira',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 255, 8),
                //color: Color.fromARGB(255, 117, 8, 1),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
