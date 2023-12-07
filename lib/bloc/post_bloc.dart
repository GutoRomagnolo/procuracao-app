import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/provider/firebase_firestore.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List<PostModel> result = [];
  StreamSubscription? subscription;

  PostBloc() : super(PostState(result: [])) {
    on<CreatePost>(
      (event, emit) async {
        FirestoreDatabase.helper.createPost(event.post);
      },
    );

    on<RetrievePost>(
      (event, emit) async {
        result = await FirestoreDatabase.helper.retrievePosts();
        emit(PostState(result: result));
      },
    );

    on<RetrieveOnePost>(
      (event, emit) async {
        result = await FirestoreDatabase.helper.retrievePostById(event.postId);
        emit(PostState(result: result));
      },
    );

    on<DeletePost>(
      (event, emit) => FirestoreDatabase.helper.deletePost(event.postId),
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

class DeletePost extends PostEvent {
  String postId;

  DeletePost({required this.postId});
}

class PostState {
  List<PostModel> result;
  PostState({required this.result});
}
