import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/restrict_area/view_notifications.dart';
import 'package:procuracaoapp/views/restrict_area/view_posts.dart';

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
          body: IndexedStack(
            index: _selectedBottomTabIndex,
            children: const [
              ViewPosts(),
              ViewPosts(),
              ViewNotifications(),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.green,
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/new-post');
            },
            icon: const Icon(Icons.add),
            label: const Text('Nova postagem'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_library_add),
                label: 'Minhas postagens',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notificações',
              ),
            ],
            currentIndex: _selectedBottomTabIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: _bottomBarItemTapped,
          ),
        );
      },
    );
  }
}
