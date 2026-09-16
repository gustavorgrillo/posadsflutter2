import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Janela());
}

class Janela extends StatelessWidget {
  const Janela({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Principal(),
      ),
    );
  }
}

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final respostaController = TextEditingController();

  // Operação mockada
  final int numero1 = 7;
  final int numero2 = 8;

  bool? correto;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quanto é?',
            style: GoogleFonts.montserrat(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            '$numero1 x $numero2 = ?',
            style: GoogleFonts.montserrat(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 150,
            child: TextField(
              controller: respostaController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Resposta',
              ),
              onChanged: (texto) {
                setState(() {
                  if (texto == '56') {
                    correto = true;
                  } else {
                    correto = false;
                  }
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          if (correto == true)
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
          if (correto == false)
            const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 50,
            ),
        ],
      ),
    );
  }
}
