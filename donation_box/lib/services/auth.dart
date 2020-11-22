import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';


class User {
  final String uid;
  User({@required this.uid});
}

abstract class AuthBase {
  Future<User> signInWithEmailAndPassword (String email,String password);
  Future<User> createUserWithEmailAndPassword (String email,String password);
  Future<User> signInWithGoogle();
  Stream<User> get onAuthStateChanged;
  Future<User> currentUser();
  Future<String> currentUserID();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();

    return _userFromFirebase(user);
  }
  @override
  Future<String> currentUserID() async {
    String volID;
    final user = await _firebaseAuth.currentUser();
    volID=user.uid;
    return volID;
  }
  @override
  Future<User> signInWithEmailAndPassword (String email,String password)async{
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);


  }
  @override
  Future<User> createUserWithEmailAndPassword (String email,String password)async{
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(authResult.user);

  }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth =
          await googleAccount.authentication;
      if(googleAuth.accessToken !=null && googleAuth.idToken!=null) {
        final authResult = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.getCredential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return _userFromFirebase(authResult.user);
      }else{
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing google auth token',

        );
      }
    }
    else{
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign-in Aborted By User',

      );
    }
  }

  @override
  Future<void> signOut() async {
    final googleSignIn= GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
