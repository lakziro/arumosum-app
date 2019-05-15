import 'package:firebase_auth/firebase_auth.dart';


class UserData {
  String userName;
  String userEmail;
  String password;
  String phoneNumber;
  String uid;
  bool returnSecureToken;

  UserData(
      {this.uid,
      this.userName,
      this.userEmail,
      this.password,
      this.phoneNumber,
      this.returnSecureToken});
}

// to create new user
class UserAuth {
  Future<FirebaseUser> createUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: userData.userEmail, password: userData.password);
  }


// to verify existing user


  Future<FirebaseUser> verifyUser(UserData userData) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    return await firebaseAuth.signInWithEmailAndPassword(
        email: userData.userEmail, password: userData.password);
  }


  
  
  }

