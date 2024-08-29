import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/auth/signin/data/repo/auth_repo_impl.dart';
import 'package:spotify_clone/features/auth/signin/data/sources/auth_firebase_services.dart';
import 'package:spotify_clone/features/auth/signin/domain/repo/auth_repository.dart';
import 'package:spotify_clone/features/auth/signin/domain/usecases/signin_usecase.dart';
import 'package:spotify_clone/features/auth/signin/domain/usecases/signup_usecase.dart';

final sl = GetIt.instance;

Future<void> initalizeDependencies() async {
  sl.registerSingleton<AuthFirebaseServices>(
      AuthFirebaseServicesImplementation());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImplementation());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
}
