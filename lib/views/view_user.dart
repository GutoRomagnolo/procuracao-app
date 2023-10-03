import 'package:flutter/material.dart';

class ViewUser extends StatelessWidget {
  const ViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ProcuraCão'),
          backgroundColor: Colors.white, // Cor do appbar
        ),
        body: Container(
          color: const Color.fromRGBO(240, 241, 223, 1),
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: [
                const Text(
                  "Alterar dados cadastrais",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Digite o seu nome",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    hintText: "user@domain.br",
                    labelText: "Digite seu e-mail",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    child: const Text("Salvar dados"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
