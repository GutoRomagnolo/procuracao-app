// post_details.dart
import 'package:flutter/material.dart';
import 'package:procuracaoapp/model/post_model.dart';

class PostDetailsScreen extends StatelessWidget {
  final PostModel postModel;

  const PostDetailsScreen({Key? key, required this.postModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes do post'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Parte superior com imagem e texto centralizados
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Exibir a imagem do post
                  Image.network(
                    postModel.path,
                    width: 200.0, // Ajuste conforme necessário
                    height: 200.0, // Ajuste conforme necessário
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10.0),
                  // Exibir o texto do post
                  Text(
                    postModel.name,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Conteúdo dos detalhes do post
            _buildDetailsContent(),
            // Área de comentários
            _buildCommentsSection(),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, '/new-post');
          },
          icon: const Icon(Icons.add),
          label: const Text('Novo comentário'),
        ));
  }

  Widget _buildDetailsContent() {
    // Lógica para exibir os detalhes do post
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Adicione widgets para exibir detalhes, se necessário
          Text(postModel.description),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    // Lógica para exibir a área de comentários
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comentários',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          // Adicione widgets para exibir os comentários, se necessário
          Text('Comentários aqui...'),
        ],
      ),
    );
  }
}
