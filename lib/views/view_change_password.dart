import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/menu_component.dart';

class ViewChangePassword extends StatelessWidget {
  const ViewChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Alterar senha de acesso',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          backgroundColor: Colors.white, // Cor do appbar
        ),
        drawer: MenuComponent(parentContext: context),
        body: Container(
          color: const Color.fromRGBO(240, 241, 223, 1),
          padding: const EdgeInsets.all(40.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: 'Digite sua senha antiga',
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
                    labelText: 'Digite sua senha nova',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 5),
                          content: Text('Senha alterada com sucesso!'),
                        ),
                      )
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    child: const Text(
                      'SALVAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
