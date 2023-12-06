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
      var snapshot = await task.whenComplete(() {});
      post.path = await snapshot.ref.getDownloadURL();

      await usersCollection.doc(AuthBloc.uid).collection('posts').add(
        {
          'name': post.name,
          'description': post.description,
          'path': post.path,
          'coordenates': post.coordenates,
        },
      );
    }
  }

  // getNoteList() async {
  //   QuerySnapshot snapshot =
  //       await usersCollection.doc(authBloc.uid).collection("my_notes").get();

  //   NoteCollection retorno = NoteCollection();

  //   for (var doc in snapshot.docs) {
  //     Note note = Note.fromMap(doc.data());
  //     retorno.insertNoteOfId(doc.id, note);
  //   }

  //   return retorno;
  // }

  // getNote(noteId) async {
  //   DocumentSnapshot doc = await usersCollection
  //       .doc(authBloc.uid)
  //       .collection("my_notes")
  //       .doc(noteId)
  //       .get();
  //   return Note.fromMap(doc.data());
  // }

  // insertNote(Note note) async {
  //   // Passo 1
  //   DocumentReference ref = await usersCollection
  //       .doc(authBloc.uid)
  //       .collection(
  //         "my_notes",
  //       )
  //       .add({
  //     "title": post.title,
  //     "description": post.description,
  //     "path": post.path
  //   });

  //   if (post.fileBytes != null) {
  //     UploadTask? task = StorageServer.helper
  //         .insertImage(authBloc.uid!, ref.id, post.fileBytes!);
  //     var snapshot = await task.whenComplete(() {});
  //     post.path = await snapshot.ref.getDownloadURL();

  //     await usersCollection
  //         .doc(authBloc.uid)
  //         .collection("my_notes")
  //         .doc(ref.id)
  //         .update({
  //       "title": post.title,
  //       "description": post.description,
  //       "path": post.path
  //     });
  //   }

  //   // Passo 3: Autalizar o firestore com a URL
  // }

  // updateNote(noteId, Note note) async {
  //   usersCollection
  //       .doc(authBloc.uid)
  //       .collection("my_notes")
  //       .doc(
  //         noteId,
  //       )
  //       .update(
  //     {
  //       "title": post.title,
  //       "description": post.description,
  //     },
  //   );
  // }

  // deleteNote(noteId) async {
  //   await usersCollection
  //       .doc(authBloc.uid)
  //       .collection("my_notes")
  //       .doc(noteId)
  //       .delete();
  // }

  Stream get stream {
    return usersCollection
        .doc(authBloc.uid)
        .collection("my_notes")
        .snapshots()
        .map((snapshot) {
      NoteCollection retorno = NoteCollection();

      for (var doc in snapshot.docs) {
        Note note = Note.fromMap(doc.data());
        retorno.insertNoteOfId(doc.id, note);
      }

      return retorno;
    });
  }
}
