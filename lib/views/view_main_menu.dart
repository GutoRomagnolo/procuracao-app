import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMainMenu extends StatelessWidget {
  const ViewMainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(240, 241, 223, 1), // Cor do corpo da tela
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/procuracao-logo.png", // Certifique-se de colocar a imagem na pasta "assets"
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo ao ProcuraCão',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: GoogleFonts.quicksand().fontFamily,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color.fromRGBO(240, 241, 223, 1),
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(97, 164, 80, 1),
                            ),
                          ),
                          hintText: "exemplo@hotmail.com",
                          labelText: "Digite seu e-mail",
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
                          labelText: "Digite sua senha",
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
                                  Theme.of(context).primaryColor)),
                          child: const Text("Fazer login"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shadowColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        child: const Text(
                          "Quero me cadastrar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 180, 231)),
                        ),
                      ),
                    ],
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
