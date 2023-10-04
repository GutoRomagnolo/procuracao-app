import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/views/view_feed_my_posts.dart';
import 'package:procuracaoapp/views/view_feed_notifications.dart';
import 'package:procuracaoapp/views/view_feed_users_posts.dart';

class ViewFeed extends StatelessWidget {
  const ViewFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Feed',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
          backgroundColor: Colors.white, // Cor do appbar
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 180, 231, 0.5),
                ),
                child: Text(
                  "Olá {{user}},\n\nSeja bem-vindo ao ProcuraCão",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                leading: Icon(Icons.feed),
                title: Text("Feed"),
                // onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Dados cadastrais"),
                // onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.password),
                title: Text("Alterar senha"),
                // onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_sharp),
                title: Text("Sair do aplicativo"),
              ),
            ],
          ),
        ),
        body: const IndexedStack(
          index: 0,
          children: [
            ViewFeedUsersPosts(),
            ViewFeedMyPosts(),
            ViewFeedNotifications(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: "Feed",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_add),
              label: "Minhas postagens",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notificações",
            ),
          ],
        ),
      ),
    );
  }
}
