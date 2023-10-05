import 'package:flutter/material.dart';

class ViewFeedNotifications extends StatelessWidget {
  const ViewFeedNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: const Column(
        children: [
          ListTile(
            title: Text(
              "Gata Princesa",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "Vi ela próximo a área verde do CECAP, ela é filhote ainda?."),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Gato Frajolo",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Vi esses dias perto do campo de futebol."),
          ),
          Divider(),
        ],
      ),
    );
  }
}
