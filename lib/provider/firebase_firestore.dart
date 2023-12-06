import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';

class FirestoreDatabase {
  static FirestoreDatabase helper = FirestoreDatabase._createInstance();

  FirestoreDatabase._createInstance();

  AuthBloc? authBloc;

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  getNoteList() async {
    QuerySnapshot snapshot =
        await usersCollection.doc(authBloc.uid).collection("my_notes").get();

    NoteCollection retorno = NoteCollection();

    for (var doc in snapshot.docs) {
      Note note = Note.fromMap(doc.data());
      retorno.insertNoteOfId(doc.id, note);
    }

    return retorno;
  }

  getNote(noteId) async {
    DocumentSnapshot doc = await usersCollection
        .doc(authBloc.uid)
        .collection("my_notes")
        .doc(noteId)
        .get();
    return Note.fromMap(doc.data());
  }

  insertNote(Note note) async {
    // Passo 1
    DocumentReference ref = await usersCollection
        .doc(authBloc.uid)
        .collection(
          "my_notes",
        )
        .add({
      "title": note.title,
      "description": note.description,
      "path": note.path
    });

    if (note.fileBytes != null) {
      UploadTask? task = StorageServer.helper
          .insertImage(authBloc.uid!, ref.id, note.fileBytes!);
      var snapshot = await task.whenComplete(() {});
      note.path = await snapshot.ref.getDownloadURL();

      await usersCollection
          .doc(authBloc.uid)
          .collection("my_notes")
          .doc(ref.id)
          .update({
        "title": note.title,
        "description": note.description,
        "path": note.path
      });
    }

    // Passo 3: Autalizar o firestore com a URL
  }

  updateNote(noteId, Note note) async {
    usersCollection
        .doc(authBloc.uid)
        .collection("my_notes")
        .doc(
          noteId,
        )
        .update(
      {
        "title": note.title,
        "description": note.description,
      },
    );
  }

  deleteNote(noteId) async {
    await usersCollection
        .doc(authBloc.uid)
        .collection("my_notes")
        .doc(noteId)
        .delete();
  }

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
