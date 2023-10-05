import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/model/model_share_location.dart';
import 'package:procuracaoapp/views/view_feed.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_user_data.dart';
import 'package:procuracaoapp/views/view_user_password.dart';

class ViewFeedPost extends StatefulWidget {
  const ViewFeedPost({super.key});

  @override
  State<ViewFeedPost> createState() => _ViewFeedPostState();
}

class _ViewFeedPostState extends State<ViewFeedPost> {
  final ModelShareLocation modelShareLocation = ModelShareLocation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Criar nova postagem',
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Descreva brevemente a situação",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      child: const Text(
                        "Escolha uma foto do animal",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Switch(
                      value: modelShareLocation.shareLocation,
                      onChanged: (bool? inValue) {
                        if (inValue != null) {
                          setState(() {
                            modelShareLocation.shareLocation = inValue;
                          });
                        }
                      },
                    ),
                    const Text("Compartilhar localização"),
                  ],
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
                          content: Text("Postagem cadastrada com sucesso!"),
                        ),
                      ),
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
