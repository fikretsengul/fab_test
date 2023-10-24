import 'dart:async';

import 'package:commons/errors.dart';
import 'package:commons/types.dart';
import 'package:dependencies/fpdart.dart';
import 'package:dependencies/injectable.dart';
import 'package:networking/networking.dart';

import '../model/user.module.dart';
import '../other/failure/failures.dart';

@lazySingleton
class AuthRepository {
  AuthRepository(this._dio);

  final DioClient _dio;

  AsyncEither<User> login(
    String username,
    String password,
  ) async {
    // final request = await _dio.invoke('/login', RequestType.post);

    // return request.pick(
    //   onFailure: Either.failure,
    //   onData: (response) => Either.data(
    //     User.fromJson(response.data as Map<String, dynamic>),
    //   ),
    // );

    final isIdPwCorrect = username == 'test' && password == 'test';

    if (isIdPwCorrect) {
      final user = User.empty();

      Timer(const Duration(seconds: 2), () {});

      return Right(user);
    } else {
      return Left(WrongCredentialsFailure());
    }
  }

  AsyncEither<void> logout() async {
    try {
      // Implement custom logout operation.

      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
