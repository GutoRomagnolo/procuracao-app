import 'package:flutter/material.dart';

class ViewMainMenu extends StatelessWidget {
  const ViewMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProcuraCão'),
        backgroundColor: Colors.white, // Cor do appbar
      ),
      body: Container(
        color: Colors.white, // Cor do corpo da tela
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'procuracao-logo.png', // Certifique-se de colocar a imagem na pasta "assets"
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'Bem-vindo ao ProcuraCão',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Adicione a ação do botão aqui
                },
                child: const Text('Começar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}