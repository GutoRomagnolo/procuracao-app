import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/provider/firebase_storage.dart';

class FirestoreDatabase {
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  createPost(PostModel post) async {
    DocumentReference reference =
        await usersCollection.doc(AuthBloc.uid).collection('posts').add(
      {
        'name': post.name,
        'description': post.description,
        'path': post.path,
        'coordenates': post.coordenates,
      },
    );

    if (post.fileBytes != null) {
      UploadTask? task = StorageServer.helper
          .insertImage(AuthBloc.uid, reference.id, post.fileBytes!);
      var snapshot = await task!.whenComplete(() {});
      post.path = await snapshot.ref.getDownloadURL();

      await usersCollection
          .doc(AuthBloc.uid)
          .collection('posts')
          .doc(reference.id)
          .update(
        {
          'name': post.name,
          'description': post.description,
          'path': post.path,
          'coordenates': post.coordenates,
        },
      );
    }
  }

  retrievePosts() async {
    QuerySnapshot snapshot =
        await usersCollection.doc(AuthBloc.uid).collection('posts').get();

    List<PostModel> result = [];

    for (var doc in snapshot.docs) {
      PostModel post = PostModel.fromMap(doc.data());
      result.add(post); // { doc.id, post }
    }

    return result;
  }

  retrievePostById(postId) async {
    DocumentSnapshot doc = await usersCollection
        .doc(AuthBloc.uid)
        .collection('posts')
        .doc(postId)
        .get();
    return PostModel.fromMap(doc.data());
  }

  deletePost(postId) async {
    await usersCollection
        .doc(AuthBloc.uid)
        .collection('posts')
        .doc(postId)
        .delete();
  }

  Stream get stream {
    return usersCollection
        .doc(AuthBloc.uid)
        .collection('posts')
        .snapshots()
        .map(
      (snapshot) {
        List<PostModel> result = [];

        for (var doc in snapshot.docs) {
          PostModel post = PostModel.fromMap(doc.data());
          result.add(post); // doc.id,
        }

        return result;
      },
    );
  }
}
