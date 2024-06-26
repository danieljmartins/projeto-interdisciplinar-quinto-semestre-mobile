import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const MaterialApp(
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFCA054D),
        body: Stack(
          alignment: Alignment.center,
          children: [
            // Cabeçalho
            Positioned(
              top: 29.0,
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

            // Quadrado
            Positioned(
              top: 82,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Container(
                  width: 304.0,
                  height: 354.0,
                  color: const Color.fromRGBO(59, 28, 50, 1),
                ),
              ),
            ),

            // Texto do quadrado "The Riddler"
            const Positioned(
              top: 82,
              left: 67,
              child: Text(
                'The Riddler',
                style: TextStyle(
                  color: Color(0xFFCA054D),
                  fontFamily: 'Passion One',
                  fontWeight: FontWeight.w900,
                  fontSize: 39.0,
                ),
              ),
            ),

            // Imagem do Charada
            Positioned(
              width: 510.0,
              top: 112.0,
              left: -55.0,
              child: Image.asset(
                'lib/assets/imagens/charada.png',
                gaplessPlayback: true,
              ),
            ),

            // Texto "Bem Vindo"
            const Positioned(
              width: 304.0,
              height: 28.0,
              top: 443.0,
              child: Text(
                'Bem Vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),

            // Texto "VERIFACT"
            const Positioned(
              width: 304.0,
              height: 44.0,
              top: 472.0,
              child: Text(
                'VERIFACT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Passion One',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),

            // Lista
            Positioned(
              width: 360.0,
              top: 530.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: _buildListItem(
                      'Verifact é um aplicativo que atua no combate às Fake News',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: _buildListItem(
                      'Através do uso de inteligência artificial, conseguimos detectar padrões de informações e notícias falsas',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: _buildListItem(
                      'Consulte qualquer informação e verifique sua veracidade.',
                    ),
                  ),
                ],
              ),
            ),

            // Botão
            Positioned(
              width: 290.0,
              height: 55.0,
              top: 703.0,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  //MaterialPageRoute(builder: (context) => const Pesquisa()),
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B1C32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Avançar',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para construir a lista com os marcadores (círculos)
  Widget _buildListItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 13.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
