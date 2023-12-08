import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/model/comment_model.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/bloc/comment_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';

class PostDetailsScreen extends StatefulWidget {
  final PostModel postModel;

  PostDetailsScreen({Key? key, required this.postModel}) : super(key: key);

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final TextEditingController commentController = TextEditingController();
  List<CommentModel> comments = [];
  CommentModel? newComment;

  @override
  void initState() {
    super.initState();
    // Carregar os comentários ao iniciar a tela
    BlocProvider.of<CommentBloc>(context)
        .add(RetrieveComment(postId: 'tMCwpW0Dver8prsR1vFu'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do post'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                              widget.postModel.path,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.postModel.name,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.postModel.description,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                _buildCommentsSection(context, state),
                const SizedBox(height: 8.0),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCommentsSection(BuildContext context, CommentState state) {
    if (state is ObtainedComments) {
      comments = state.comments;
    }

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
              for (var comment in comments) CommentCard(comment: comment),

              // Adicione o novo comentário à lista (se existir)
              if (newComment != null) CommentCard(comment: newComment!),

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
                  CommentModel comment = CommentModel.withData(
                    content: content,
                    coordenates: [],
                    viewed: false,
                  );

                  // Adiciona o novo comentário ao início da lista geral de comentários
                  setState(() {
                    newComment = comment;
                    comments.insert(0, comment);
                  });

                  BlocProvider.of<CommentBloc>(context).add(CreateComment(comment: comment));

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

class CommentCard extends StatelessWidget {
  final CommentModel comment;

  CommentCard({required this.comment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Usuário',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(comment.content),
          ],
        ),
      ),
    );
  }
}
