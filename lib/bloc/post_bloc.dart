import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/model/post_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? uid;

  PostBloc() : super(WithoutPosts()) {
    firestore
      .doc(uid)
      .collection("posts")
      .add({
        
      })
  }
}

abstract class PostEvent {}

class CreatePost extends PostEvent {
  PostModel post;

  Add(post);
}

class RetrievePost extends PostEvent {}

class UpdatePost extends PostEvent {}

class DeletePost extends PostEvent {}

abstract class PostState {}

class WithoutPosts extends PostState {}

class ObtainedPosts extends PostState {
  PostModel post;

  ObtainedPosts({required this.post});
}

class ErrorPosts extends PostState {
  final String message;

  ErrorPosts({required this.message});
}
