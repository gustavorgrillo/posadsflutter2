import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_2/frase_controle.dart';

void main() {
  runApp(const Janela());
}

class Janela extends StatelessWidget {
  const Janela({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          body: SafeArea(
              child:
                  Principal())), // SafeArea evita que o conteúdo fique embaixo da barra de status
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  FraseControle controle = FraseControle();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centraliza os elementos na tela
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            controle.fraseAtual.texto,
            style: GoogleFonts.montserrat(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),

        // A IMAGEM AGORA VEM DO CONTROLE E MUDA DINAMICAMENTE
        Image.network(
          controle.fraseAtual.imagem,
          width: 250,
          height: 350,
          fit: BoxFit
              .cover, // Garante que a pintura preencha bem o tamanho definido
          headers: const {
            'User-Agent':
                'MeuAppFrases/1.0 (contato@seuemail.com)' // Evita bloqueio da Wikipédia
          },
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 50),
        ),

        const SizedBox(height: 16), // Espaçamento entre os blocos

        GestureDetector(
          onTap: () {
            setState(() {
              controle.fraseAtual.mudaLike();
            });
          },
          child: Icon(
            controle.fraseAtual.liked ? Icons.favorite : Icons.favorite_border,
            color: controle.fraseAtual.liked ? Colors.red : Colors.grey,
            size: 32,
          ),
        ),
        Text(
          controle.fraseAtual.autor,
          style: GoogleFonts.msMadi(fontSize: 24),
        ),

        const SizedBox(height: 24),

        ElevatedButton(
            onPressed: () {
              setState(() {
                controle.proximaFrase();
              });
            },
            child: const Text('Próxima'))
      ],
    );
  }
}
