import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/features/auth/signin/data/models/create_user_request.dart';

abstract class AuthFirebaseServices {
  Future<Either> signUp(CreateUserRequest createUserRequest);
  Future<void> signIn();
  Future<void> signOut();
}

class AuthFirebaseServicesImplementation extends AuthFirebaseServices {
  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUserRequest.email, password: createUserRequest.password);
      return const Right('Sign in Successful.');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email address.';
      }
      return Left(message);
    }
  }

  @override
  Future<void> signIn() async {}

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.toString());
    }
  }
}
