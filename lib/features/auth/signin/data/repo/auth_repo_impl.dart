import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/signin/data/models/create_user_request.dart';
import 'package:spotify_clone/features/auth/signin/data/sources/auth_firebase_services.dart';
import 'package:spotify_clone/features/auth/signin/domain/repo/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImplementation implements AuthRepository {
  @override
  Future<void> signIn() async {}

  @override
  Future<void> signOut() async {}

  @override
  Future<Either> signUp(CreateUserRequest createUserRequest) async {
    return await sl<AuthFirebaseServices>().signUp(createUserRequest);
  }
}
