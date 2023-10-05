import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/views/view_feed.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_user_password.dart';

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
                // Text(
                //   "Alterar dados cadastrais",
                //   style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //       fontFamily: GoogleFonts.quicksand().fontFamily),
                // ),
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
                    hintText: "exemplo@hotmail.comW",
                    labelText: "Digite seu e-mail",
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
                          content: Text("Cadastro alterado com sucesso!")))
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
