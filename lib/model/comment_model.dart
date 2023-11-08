import 'package:procuracaoapp/model/post_model.dart';

class CommentModel {
  final String uid;
  final PostModel postModel;
  final String content;
  final List<double> coordenates;
  final bool read;

  CommentModel(
    this.uid,
    this.postModel,
    this.content,
    this.coordenates,
    this.read,
  );
}
