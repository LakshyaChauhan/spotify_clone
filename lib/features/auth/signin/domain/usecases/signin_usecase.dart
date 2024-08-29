import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/configs/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/signin/data/models/signin_user_request.dart';
import 'package:spotify_clone/features/auth/signin/domain/repo/auth_repository.dart';

import '../../../../../service_locator.dart';

class SigninUsecase extends Usecase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
