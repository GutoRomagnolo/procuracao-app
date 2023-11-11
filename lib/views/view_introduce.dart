import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/views/view_register.dart';

class ViewIntroduction extends StatelessWidget {
  const ViewIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(240, 241, 223, 1), // Cor do corpo da tela
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'O propósito deste aplicativo é para a localização e sinalização de animais domésticos que foram perdidos, a fim de facilitar a procura dos pets de uma maneira mais rápida e direta, evitando assim entrar em grupos de redes sociais que dependem de uma longa busca por feed.\n\nOs usuários poderão cadastrar um alerta de animal perdido ou animal encontrado, com a localização no mapa e endereço, informações do animal e informações para contato.\n\nClique no em "Quero fazer parte" e entre para a nossa comunidade!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewRegister(),
                    ),
                  )
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: const Text(
                  'QUERO FAZER PARTE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(39, 180, 231, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
