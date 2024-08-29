import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/signin/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/signin/data/models/signin_user_request.dart';
import 'package:spotify_clone/features/auth/signin/data/sources/auth_firebase_services.dart';
import 'package:spotify_clone/features/auth/signin/domain/repo/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImplementation implements AuthRepository {
  @override
  Future<Either> signIn(SigninUserRequest signinUserRequest) async {
    return await sl<AuthFirebaseServices>().signIn(signinUserRequest);
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    return await sl<AuthFirebaseServices>().signUp(createUserRequest);
  }
}
