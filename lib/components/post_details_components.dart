import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/model/comment_model.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/bloc/comment_bloc.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostModel postModel;
  final CommentBloc commentBloc;
  final TextEditingController commentController = TextEditingController();

  PostDetailsScreen(
      {Key? key, required this.postModel, required this.commentBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do post'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Parte superior com imagem, texto e descrição centralizados
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Card(
                elevation: 5.0,
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
              ),
            ),
            const SizedBox(height: 8.0),
            _buildCommentsSection(context),
            const SizedBox(height: 8.0),
            // _buildCommentInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comentários',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              const Text('Comentário existente aqui...'),
              _buildNewComment(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewComment(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: commentController,
                decoration: const InputDecoration(
                  hintText: 'Digite seu comentário...',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                String content = commentController.text;

                if (content.isNotEmpty) {
                  BlocProvider.of<CommentBloc>(context).add(
                    CreateComment(
                      comment: CommentModel.withData(
                        content: content,
                        coordenates: [],
                        viewed: false
                      ),
                    ),
                  );

                  commentController.clear();
                }
              },
              icon: const Icon(Icons.send),
              tooltip: 'Enviar comentário',
            ),
          ],
        ),
      ],
    );
  }
}
