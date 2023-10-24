import 'package:dependencies/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../../bloc/auth.bloc.dart';

extension AuthStateToBoolListenableExt on BlocBase<AuthState> {
  ValueListenable<bool> isAuthenticatedListenable() {
    final notifier = ValueNotifier<bool>(state is AuthAuthenticated);
    stream.listen((value) {
      notifier.value = value is AuthAuthenticated;
    });
    return notifier;
  }
}
