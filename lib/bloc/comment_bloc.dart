import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/bloc/post_bloc.dart';
import 'package:procuracaoapp/model/comment_model.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String commentId;
  String postId = "h3LXsjiptMugmfpWnib6";

  CommentBloc({required this.commentId}) : super(WithoutComments()) {
    on<CreateComment>(
      (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('posts')
              .doc(postId)
              .collection('comments')
              .add(
            {
              'content': event.comment.content,
              'coordenates': event.comment.coordenates,
              'viewed': event.comment.viewed,
            },
          );
        } catch (e) {
          emit(ErrorComments(
              message:
                  'Não foi possível cadastrar o comentário, tente novamente.'));
        }
      },
    );

    on<RetrieveComment>(
      (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('posts')
              .doc(postId)
              .collection('comments')
              .get();
        } catch (e) {
          emit(ErrorComments(
              message:
                  'Não foi possível obter os contários, tente novamente.'));
        }
      },
    );

    on<RetrieveOneComment>(
      (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('posts')
              .doc(postId)
              .collection('comments')
              .doc(event.commentId)
              .get();
        } catch (e) {
          emit(ErrorComments(
              message:
                  'Não foi possível obter esse comentário, tente novamente.'));
        }
      },
    );

    on<UpdateComment>(
      (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('posts')
              .doc(postId)
              .collection('comments')
              .doc(event.commentId)
              .update(
            {
              'content': event.comment.content,
              'coordenates': event.comment.coordenates,
              'viewed': event.comment.viewed,
            },
          );
        } catch (e) {
          emit(ErrorComments(
              message:
                  'Não foi possível atualizar o comentário, tente novamente.'));
        }
      },
    );

    on<DeleteComment>(
      (event, emit) {
        try {
          firestore
              .collection('users')
              .doc(AuthBloc.uid)
              .collection('posts')
              .doc(postId)
              .collection('comments')
              .doc(event.commentId)
              .delete();
        } catch (e) {
          emit(ErrorComments(
              message:
                  'Não foi possível remover o comentário, tente novamente.'));
        }
      },
    );
  }
}

abstract class CommentEvent {}

class CreateComment extends CommentEvent {
  CommentModel comment;

  CreateComment({required this.comment});
}

class RetrieveComment extends CommentEvent {}

class RetrieveOneComment extends CommentEvent {
  String commentId;

  RetrieveOneComment({required this.commentId});
}

class UpdateComment extends CommentEvent {
  String commentId;
  CommentModel comment;

  UpdateComment({required this.commentId, required this.comment});
}

class DeleteComment extends CommentEvent {
  String commentId;

  DeleteComment({required this.commentId});
}

abstract class CommentState {}

class WithoutComments extends CommentState {}

class ObtainedComments extends CommentState {
  CommentModel comment;

  ObtainedComments({required this.comment});
}

class ErrorComments extends CommentState {
  final String message;

  ErrorComments({required this.message});
}
