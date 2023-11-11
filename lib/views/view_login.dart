import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/view_register.dart';

class ViewLogin extends StatefulWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Não foi possível realizar o login'),
                content: Text(state.message),
              );
            },
          );
        }
      },
      builder: (context, state) {
        // if (state is! Authenticated) {
        return Scaffold(
          body: Container(
            color: const Color.fromRGBO(240, 241, 223, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/procuracao-logo.png',
                    height: 150,
                    width: 150,
                  ),
                  Text(
                    'Bem-vindo(a) ao ProcuraCão!',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: GoogleFonts.quicksand().fontFamily,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    color: const Color.fromRGBO(240, 241, 223, 1),
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (String? inValue) {
                              if (inValue != null) {
                                if (inValue.isEmpty) {
                                  return 'Insira um e-mail de usuário';
                                }
                              }
                              return null;
                            },
                            onSaved: (String? inValue) {
                              username = inValue ?? '';
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(97, 164, 80, 1),
                                ),
                              ),
                              hintText: 'exemplo@hotmail.com',
                              labelText: 'Digite seu e-mail',
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
                                  return 'Mínimo de 8 caracteres';
                                }
                              }
                              return null;
                            },
                            onSaved: (String? inValue) {
                              password = inValue ?? '';
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(97, 164, 80, 1),
                                ),
                              ),
                              labelText: 'Digite sua senha',
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
                                    LoginUser(
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
                              child: const Text('FAZER LOGIN'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/register');
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text(
                              'QUERO ME CADASTRAR',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(39, 180, 231, 1),
                              ),
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
        // }
      },
    );
  }
}
