import 'package:dependencies/get_it.dart';
import 'package:dependencies/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import './configure_di.config.dart';

@InjectableInit(initializerName: 'init')
void configureDependencies(GetIt di, Environment env) {
  di.init(environment: env.name);
}

@module
abstract class FlutterSecureStorageModule {
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
}
