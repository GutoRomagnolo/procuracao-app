import 'package:flutter/material.dart';
import 'package:procuracaoapp/model/post_model.dart';

class PostComponent extends StatelessWidget {
  final PostModel postModel;

  const PostComponent({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(title: Text(postModel.name)),
          Text(postModel.description),
          const SizedBox(height: 20),
          Image.asset(postModel.path),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
