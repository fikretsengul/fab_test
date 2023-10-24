import 'package:analytics/analytics.dart' as analytics;
import 'package:auth/auth.dart' as auth;
import 'package:commons/commons.dart' as commons;
import 'package:dependencies/get_it.dart';
import 'package:dependencies/injectable.dart';
import 'package:networking/networking.dart' as networking;
import 'package:storage/storage.dart' as storage;

import 'configure_di.config.dart';

final GetIt di = GetIt.instance;

@InjectableInit(initializerName: 'init')
void initLocator(Environment env) {
  /// Configures core packages
  analytics.configureDependencies(di, env);
  commons.configureDependencies(di, env);
  networking.configureDependencies(di, env);
  storage.configureDependencies(di, env);

  /// Configures features
  auth.configureDependencies(di, env);

  /// Inits injection
  di.init(environment: env.name);
}
