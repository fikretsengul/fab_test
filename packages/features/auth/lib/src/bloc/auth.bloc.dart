import 'package:commons/enums.dart';
import 'package:dependencies/flutter_bloc.dart';
import 'package:dependencies/freezed_annotation.dart';
import 'package:dependencies/injectable.dart';
import 'package:networking/networking.dart';

part 'auth_cubit.freezed.dart';
part 'state/auth.state.dart';

@lazySingleton
class AuthBloc extends Cubit<AuthState> {
  AuthBloc(this._dioTokenRefresh) : super(const AuthLoading()) {
    _dioTokenRefresh.interceptor.authStatus.listen(
      (status) async {
        if (status == AuthStatus.authenticated) {
          emit(const AuthAuthenticated());
        } else if (status == AuthStatus.unauthenticated) {
          emit(const AuthUnauthenticated());
        }
      },
    );
  }

  final DioTokenRefresh _dioTokenRefresh;
}
