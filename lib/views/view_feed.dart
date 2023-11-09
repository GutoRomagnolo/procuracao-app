import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/menu_component.dart';
import 'package:procuracaoapp/views/view_feed_my_posts.dart';
import 'package:procuracaoapp/views/view_feed_notifications.dart';
import 'package:procuracaoapp/views/view_feed_post.dart';
import 'package:procuracaoapp/views/view_feed_users_posts.dart';

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
      drawer: MenuComponent(parentContext: context),
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
        icon: const Icon(Icons.add),
        label: const Text("Nova postagem"),
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
