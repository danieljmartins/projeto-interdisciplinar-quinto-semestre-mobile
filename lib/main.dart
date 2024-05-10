import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
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
              top: 45.0,
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
              top: 115,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Container(
                  width: 304.0,
                  height: 354.0,
                  color: const Color(0xFF3B1C32),
                ),
              ),
            ),
            // Texto do quadrado "The Riddler"
            const Positioned(
              top: 114,
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
              top: 145.0,
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
              top: 479.0,
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
              top: 506.0,
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
            // Lista de texto com bolinhas
            Positioned(
              width: 304.0,
              top: 560.0, // Posição vertical abaixo do texto "VERIFACT"
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildListItem(
                      'Veifact é um aplicativo que visa combater as fake news'),
                  _buildListItem(
                      'Através do uso de inteligência artificial conseguimos detectar padrões de informações e notícias falsas'),
                  _buildListItem(
                      'Você pode consultar o que quiser, e se informar se trata-se de um fato ou não'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para construir cada item da lista com bolinha
  Widget _buildListItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          margin: const EdgeInsets.only(top: 8, right: 8),
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
