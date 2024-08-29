import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/signin/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/signin/data/models/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signIn(SigninUserRequest signinUserRequest);
  Future<Either> signUp(CreateUserRequest createUserRequest);
  Future<void> signOut();
}
