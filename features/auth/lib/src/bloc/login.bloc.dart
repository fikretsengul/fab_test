import 'package:commons/errors.dart';
import 'package:dependencies/flutter_bloc.dart';
import 'package:dependencies/freezed_annotation.dart';
import 'package:dependencies/injectable.dart';

import '../model/user.module.dart';
import '../service/auth_repository.dart';

part 'login_cubit.freezed.dart';
part 'state/login.state.dart';

@lazySingleton
class LoginBloc extends Cubit<LoginState> {
  LoginBloc(this._repository) : super(const LoginInitial());

  final AuthRepository _repository;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(const LoginLoading());

    final response = await _repository.login(username, password);

    await Future.delayed(const Duration(seconds: 2), () {});

    response.fold(
      (failure) => emit(LoginFailed(failure)),
      (user) => emit(LoginSucceded(user)),
    );
  }
}
