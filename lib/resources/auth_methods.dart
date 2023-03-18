
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  //firebase의 인증 auth 인스턴스를 _auth에 담아준다.
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //회원가입 유저
    Future<String> signUpUser({
    required String email, password, username, bio,
    // required Uint8List file
  }) async {
      String res = "Some error occurred";
      try {
        if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty){
          //유저 이메일 패스워드등록
          UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

          //유저의 다른정보들을 생성해준다.
          await _firestore.collection('users').doc(cred.user!.uid).set({
            'username': username,
            'uid': cred.user!.uid,
            'email': email,
            'bio': bio,
            'followers':[],
            'following':[],
          });
          /*await _firestore.collection('users').add({
            'username': username,
            'uid': cred.user!.uid,
            'email': email,
            'bio': bio,
            'followers':[],
            'following':[],
          });*/
          res = "Success";
        }
      } catch(err) {
        res = err.toString();
      }
      return res;
    }
}