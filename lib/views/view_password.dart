import 'package:flutter/material.dart';

class ViewPassword extends StatelessWidget {
  const ViewPassword({super.key});

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
                  "Alterar senha de acesso",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Digite sua senha antiga",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Digite sua senha nova",
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
                    child: const Text("Alterar senha"),
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
