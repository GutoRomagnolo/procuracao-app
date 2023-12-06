import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/restrict_area/view_feed.dart';

class MenuComponent extends StatefulWidget {
  final BuildContext parentContext;

  const MenuComponent({super.key, required this.parentContext});

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
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
        return Drawer(
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
                leading: const Icon(Icons.exit_to_app_sharp),
                title: const Text("Sair do aplicativo"),
                onTap: () {
                  if (state is Authenticated) {
                    BlocProvider.of<AuthBloc>(widget.parentContext)
                        .add(Logout());
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
