import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  //firebase 스토리지의 인스턴스를 선언해준다.
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //firebase에 이미지를 추가시켜줌
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost) async {
    //.ref 스토리지에대한 포인터임.
    //첫번째 child는 사진폴더에대한이름, 두번째 child는 user고유의uid로 폴더를만듬.
    Reference ref = _storage.ref().child(childName).child(_auth.currentUser!.uid);
    //그렇게 ref라는 폴더를 만든 후 putdata로 파일을 밀어넣음.
    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}