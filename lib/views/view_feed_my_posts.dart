import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewFeedMyPosts extends StatelessWidget {
  const ViewFeedMyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text(
            "Minhas postagens",
            style: TextStyle(
              fontSize: 18,
              fontFamily: GoogleFonts.quicksand().fontFamily
            )
          ),
        ],
      ),
    );
  }
}
