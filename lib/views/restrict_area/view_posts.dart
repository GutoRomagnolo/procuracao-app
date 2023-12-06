import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/post_component.dart';
import 'package:procuracaoapp/mock.dart';
import 'package:procuracaoapp/model/post_model.dart';
import './../../components/post_details_components.dart'; // Importe o arquivo que contém os detalhes do post

class ViewPosts extends StatelessWidget {
  const ViewPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: postsMock.map((e) {
          return InkWell(
            onTap: () {
              _openPostDetails(context, e);
            },
            child: PostComponent(postModel: e),
          );
        }).toList(),
      ),
    );
  }

  void _openPostDetails(BuildContext context, PostModel post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailsScreen(postModel: post),
      ),
    );
  }
}
