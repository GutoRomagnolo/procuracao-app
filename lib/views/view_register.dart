import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/view_feed.dart';

class ViewRegister extends StatefulWidget {
  const ViewRegister({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = "";
  String username = "";
  String password = "";
  String passwordConfirmation = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: const Color.fromRGBO(240, 241, 223, 1),
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Cadastre-se em nossa comunidade!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  "Encontre e divulgue pets perdidos a qualquer momento",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.quicksand().fontFamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (String? inValue) {
                    if (inValue != null) {
                      if (inValue.isEmpty) {
                        return "Insira um nome de usuário";
                      }
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    name = inValue ?? "";
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Digite seu nome",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? inValue) {
                    if (inValue != null) {
                      if (inValue.isEmpty) {
                        return "Insira um e-mail de usuário";
                      }
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    username = inValue ?? "";
                  },
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
                  validator: (String? inValue) {
                    if (inValue != null) {
                      if (inValue.length < 8) {
                        return "Mínimo de 8 caracteres";
                      }
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    password = inValue ?? "";
                  },
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
                TextFormField(
                  obscureText: true,
                  validator: (String? inValue) {
                    if (inValue != null) {
                      if (inValue.length < 8) {
                        return "Mínimo de 8 caracteres";
                      }

                      if (inValue != password) {
                        return "As senhas não coincidem";
                      }
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    password = inValue ?? "";
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(97, 164, 80, 1),
                      ),
                    ),
                    labelText: "Digite novamente sua senha",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<AuthBloc>(context).add(
                          RegisterUser(
                            username: username,
                            password: password,
                          ),
                        );
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const ViewFeed(),
                      //   ),
                      // )
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    child: const Text("CADASTRAR"),
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
