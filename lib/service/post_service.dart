import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<bool?> addCategory({
    required String name,
    required File image,
  }) async {
    try {
      CollectionReference collectionReference =
          firestore.collection('category');
      DocumentReference documentReference = collectionReference.doc();
      String docID = documentReference.id;

      final metadata = SettableMetadata(contentType: 'image/png');
      final imageRef = storage.ref().child("images/${DateTime.now()}");

      await imageRef.putFile(image, metadata);
      final String imageurl = await imageRef.getDownloadURL();

      await documentReference.set({
        "id": docID,
        "name": name,
        "image": imageurl,
      });
      return true;
    } catch (e) {
      return null;
    }
  }

  Future<List<dynamic>> getcategory() async {
    QuerySnapshot snapshot = await firestore.collection("category").get();
    var result = snapshot.docs.map((doc) => doc.data()).toList();
    return result;
  }

  Future<List<dynamic>> getallpost() async {
    QuerySnapshot snapshot = await firestore.collection("post").get();
    var result = snapshot.docs.map((doc) => doc.data()).toList();
    return result;
  }
}
