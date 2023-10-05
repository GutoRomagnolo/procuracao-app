import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/views/view_feed.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_user_data.dart';

class ViewUserPassword extends StatelessWidget {
  const ViewUserPassword({super.key});

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
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 180, 231, 0.5),
                ),
                child: Text(
                  "Olá {{user}},\n\nSeja bem-vindo ao ProcuraCão",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.feed),
                title: const Text("Feed"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewFeed(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Dados cadastrais"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewUserData(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.password),
                title: const Text("Alterar senha"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewUserPassword(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app_sharp),
                title: const Text("Sair do aplicativo"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewLogin(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
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
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 5),
                          content: Text("Senha alterada com sucesso!")))
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    child: const Text("SALVAR",
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
