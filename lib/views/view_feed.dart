import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:procuracaoapp/views/view_feed_my_posts.dart';
import 'package:procuracaoapp/views/view_feed_notifications.dart';
import 'package:procuracaoapp/views/view_feed_post.dart';
import 'package:procuracaoapp/views/view_feed_users_posts.dart';
import 'package:procuracaoapp/views/view_login.dart';
import 'package:procuracaoapp/views/view_user_data.dart';
import 'package:procuracaoapp/views/view_user_password.dart';

class ViewFeed extends StatefulWidget {
  const ViewFeed({super.key});

  @override
  State<ViewFeed> createState() => _ViewFeedState();
}

class _ViewFeedState extends State<ViewFeed> {
  int _selectedBottomTabIndex = 0;

  void _bottomBarItemTapped(int index) {
    setState(() {
      _selectedBottomTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: IndexedStack(
        index: _selectedBottomTabIndex,
        children: const [
          ViewFeedUsersPosts(),
          ViewFeedMyPosts(),
          ViewFeedNotifications()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ViewFeedPost(),
            ),
          );
        },
        icon: Icon(Icons.add),
        label: Text("Nova postagem"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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
        currentIndex: _selectedBottomTabIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _bottomBarItemTapped,
      ),
    );
  }
}
