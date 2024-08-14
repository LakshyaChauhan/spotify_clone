import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/configs/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/signin/domain/repo/auth_repository.dart';

import '../../../../../service_locator.dart';
import '../../data/models/create_user_request.dart';

class SignupUsecase extends Usecase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) {
    return sl<AuthRepository>().signUp(params!);
  }
}
