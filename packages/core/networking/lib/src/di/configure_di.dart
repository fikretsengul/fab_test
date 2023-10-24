import 'package:dependencies/dio.dart';
import 'package:dependencies/get_it.dart';
import 'package:dependencies/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import './configure_di.config.dart';

@InjectableInit(initializerName: 'init')
void configureDependencies(GetIt di, Environment env) {
  di.init(environment: env.name);
}

@module
abstract class DioModule {
  Dio get dio => Dio();
}

@module
abstract class InternetConnectionModule {
  InternetConnection get internetConnection => InternetConnection();
}
