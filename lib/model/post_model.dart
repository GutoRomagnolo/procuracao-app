import 'package:procuracaoapp/model/user_model.dart';

class PostModel {
  final String uid;
  final UserModel userModel;
  final String name;
  final String description;
  final String photo;
  final List<double> coordenates;

  PostModel(
    this.uid,
    this.userModel,
    this.name,
    this.description,
    this.photo,
    this.coordenates,
  );
}
