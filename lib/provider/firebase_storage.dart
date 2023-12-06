import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class StorageServer {
  // Atributo que irá afunilar todas as consultas
  static StorageServer helper = StorageServer._createInstance();
  // Construtor privado
  StorageServer._createInstance();

  Reference postImage = FirebaseStorage.instance.ref().child("images");

  UploadTask? insertImage(String uid, String postId, Uint8List fileBytes) {
    try {
      var ref = postImage.child(uid).child(postId);
      return ref.putData(fileBytes);
    } on FirebaseException {
      return null;
    }
  }

  deleteImage(String uid, String postId) {
    postImage.child(uid).child(postId).delete();
  }
}
