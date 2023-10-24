import 'package:dependencies/get_it.dart';
import 'package:dependencies/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

import './configure_di.config.dart';

@InjectableInit(initializerName: 'init')
void configureDependencies(GetIt di, Environment env) {
  di.init(environment: env.name);
}

@module
abstract class TalkerModule {
  Talker talker() => TalkerFlutter.init();
}
