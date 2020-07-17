import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseMethod{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;
  StorageReference _storageReference;

  // ignore: non_constant_identifier_names
  Future<void> Register(AdmNo,name,fName,mName,phone,age,cls,address,profile_url,gender) async {
    try {
      DocumentReference documentReference =
      Firestore.instance.document('Student/${AdmNo}');
      Map<String, String> info = <String, String>{
        'name':name,
        'father name':fName,
        'mother name':mName,
        'phone':phone,
        'age':age,
        'class':cls,
        'address':address,
        'admission no':AdmNo,
        'profile pic': profile_url,
        'gender':gender,
        'paid':'March'
      };
      await documentReference.setData(info);
    } catch (e) {
      print(e.message);
    }
  }

  Future<String> uploadImageToStorage(File imageFile,) async {
    try {
      _storageReference = FirebaseStorage.instance
          .ref()
          .child('${DateTime.now()}');
      StorageUploadTask storageUploadTask =
      _storageReference.putFile(imageFile);
      var url = await (await storageUploadTask.onComplete).ref.getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      return null;
    }
  }
}