import 'package:flutter/material.dart';
import 'package:procuracaoapp/model/comment_model.dart';

class NotificationComponent extends StatelessWidget {
  final CommentModel commentModel;

  const NotificationComponent({super.key, required this.commentModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        commentModel.content,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(commentModel.content),
    );
  }
}
