import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/restrict_area/view_feed.dart';

class ViewNavigation extends StatefulWidget {
  const ViewNavigation({super.key});

  @override
  State<ViewNavigation> createState() => _ViewNavigationState();
}

class _ViewNavigationState extends State<ViewNavigation> {
  int _currentScreen = 0;
  String _currentTitle = "Feed";

  void _drawerItemNavigation(int index, String title) {
    setState(() {
      _currentScreen = index;
      _currentTitle = title;
    });
  }

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
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _currentTitle,
              style: const TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            backgroundColor: Colors.white,
          ),
          body: IndexedStack(
            index: _currentScreen,
            children: const [
              ViewFeed(),
            ],
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
                    _drawerItemNavigation(0, "Feed");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app_sharp),
                  title: const Text("Sair do aplicativo"),
                  onTap: () {
                    if (state is Authenticated) {
                      BlocProvider.of<AuthBloc>(context).add(Logout());
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
