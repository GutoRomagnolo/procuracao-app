import 'package:flutter/material.dart';
import 'package:procuracaoapp/views/view_change_password.dart';
import 'package:procuracaoapp/views/view_feed.dart';
import 'package:procuracaoapp/views/view_change_register.dart';

class MenuComponent extends StatefulWidget {
  final BuildContext parentContext;

  const MenuComponent({super.key, required this.parentContext});

  @override
  State<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends State<MenuComponent> {
  @override
  Widget build(BuildContext context) {
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
            leading: const Icon(Icons.person),
            title: const Text("Dados cadastrais"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ViewChangeRegister(),
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
                  builder: (context) => const ViewChangePassword(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app_sharp),
            title: const Text("Sair do aplicativo"),
            onTap: () {
              // if (state is Authenticated) {
              // BlocProvider.of<AuthBloc>(widget.parentContext).add(Logout());
              // }
              // Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
