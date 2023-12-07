import 'package:flutter/material.dart';
import 'package:procuracaoapp/model/post_model.dart';

class PostComponent extends StatelessWidget {
  final PostModel postModel;

  const PostComponent({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                postModel.path,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              postModel.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            Text(
              postModel.description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
