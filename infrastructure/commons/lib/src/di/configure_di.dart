import 'package:dependencies/get_it.dart';
import 'package:dependencies/injectable.dart';

import './configure_di.config.dart';

@InjectableInit(initializerName: 'init')
void configureDependencies(GetIt di, Environment env) {
  di.init(environment: env.name);
}
