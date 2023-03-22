
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_fultter/models/user.dart'as model;
import 'package:instagram_fultter/resources/storage_methods.dart';

class AuthMethods {
  //firebase의 인증 auth 인스턴스를 _auth에 담아준다.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }

  //회원가입 유저
    Future<String> signUpUser({
    required String email, password, username, bio,
    required Uint8List file
  }) async {
      String res = "Some error occurred";
      try {
        if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty){
          //유저 이메일 패스워드등록
          UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

          String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

          model.User user = model.User(email: email,
              uid: cred.user!.uid,
              photoUrl: photoUrl,
              username: username,
              bio: bio,
              followers: [],
              following: []);
        //유저의 다른정보들을 생성해준다.
          await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
          res = "success";
        }
      } on FirebaseAuthException catch(err) {
        if(err.code == 'invalid-email') {
          res = '이메일을 확인해주세요';
        } else if(err.code == 'weak-password') {
          res = '비밀번호를 6자 이상으로 만들어주세요';
        }
      }
      catch(err) {
        res = err.toString();
      }
      return res;
    }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "Some body help me!";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "plase check your Fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}