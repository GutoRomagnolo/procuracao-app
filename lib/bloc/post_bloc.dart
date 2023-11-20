import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/model/post_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? postId;
  String? uid;

  PostBloc() : super(WithoutPosts()) {
    on<CreatePost>(
      (event, emit) {
        try {
          firestore.doc(uid).collection('posts').add(
            {
              'uid': event.post.uid,
              'userModel': event.post.userModel.uid,
              'name': event.post.name,
              'description': event.post.description,
              'photo': event.post.photo,
              'coordenates': event.post.coordenates,
            },
          );
        } catch (e) {
          emit(ErrorPosts(
              message:
                  'Não foi possível cadastrar a postagem, tente novamente.'));
        }
      },
    );

    on<RetrievePost>(
      (event, emit) {
        try {
          firestore.doc(uid).collection('posts').get();
        } catch (e) {
          emit(ErrorPosts(
              message: 'Não foi possível obter postagens, tente novamente.'));
        }
      },
    );

    on<RetrieveOnePost>(
      (event, emit) {
        try {
          firestore.doc(uid).collection('posts').doc(event.postId).get();
        } catch (e) {
          emit(ErrorPosts(
              message:
                  'Não foi possível obter essa postagem, tente novamente.'));
        }
      },
    );

    on<UpdatePost>(
      (event, emit) {
        try {
          firestore.doc(uid).collection('posts').doc(event.postId).update(
            {
              'uid': event.post.uid,
              'userModel': event.post.userModel.uid,
              'name': event.post.name,
              'description': event.post.description,
              'photo': event.post.photo,
              'coordenates': event.post.coordenates,
            },
          );
        } catch (e) {
          emit(ErrorPosts(
              message:
                  'Não foi possível atualizar a postagem, tente novamente.'));
        }
      },
    );

    on<DeletePost>(
      (event, emit) {
        try {
          firestore.doc(uid).collection('posts').doc(event.postId).delete();
        } catch (e) {
          emit(ErrorPosts(
              message:
                  'Não foi possível remover a postagem, tente novamente.'));
        }
      },
    );
  }
}

abstract class PostEvent {}

class CreatePost extends PostEvent {
  PostModel post;

  CreatePost({required this.post});
}

class RetrievePost extends PostEvent {}

class RetrieveOnePost extends PostEvent {
  String postId;

  RetrieveOnePost({required this.postId});
}

class UpdatePost extends PostEvent {
  String postId;
  PostModel post;

  UpdatePost({required this.postId, required this.post});
}

class DeletePost extends PostEvent {
  String postId;

  DeletePost({required this.postId});
}

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
