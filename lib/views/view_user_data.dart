import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/menu_component.dart';

class ViewUserData extends StatelessWidget {
  const ViewUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Alterar dados cadastrais',
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
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: 'Digite o seu nome',
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
                    hintText: 'exemplo@hotmail.comW',
                    labelText: 'Digite seu e-mail',
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
                          content: Text('Cadastro alterado com sucesso!'),
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
