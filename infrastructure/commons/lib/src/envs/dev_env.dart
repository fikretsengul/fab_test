import 'package:dependencies/injectable.dart';

import 'i_env.dart';

@Environment('dev')
@Singleton(as: IEnv)
class DevEnv extends IEnv {
  @override
  String get analyticsUrl => 'http://www.dev.analytics.com';

  @override
  String get baseUrl => 'http://www.dev.mock.com';

  @override
  bool get debug => true;
}
