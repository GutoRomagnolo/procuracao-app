import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewFeedMyPosts extends StatelessWidget {
  const ViewFeedMyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                const ListTile(
                  title: Text('Maiuri'),
                ),
                const Text('Fêmea, 3 anos, bastante assustada, porém mansa.'),
                const SizedBox(height: 20),
                Image.asset('./assets/maiuri.jpg'),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                const ListTile(
                  title: Text('Frajole'),
                ),
                const Text('Fêmea, 1 ano, bastante assustada, porém mansa.'),
                const SizedBox(height: 20),
                Image.asset('./assets/princesa.jpg'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
