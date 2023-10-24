import 'package:analytics/analytics.dart';
import 'package:analytics/logger.dart';
import 'package:auth/auth.dart';
import 'package:dependencies/flutter_bloc.dart';
import 'package:dependencies/injectable.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:locator/locator.dart';
import 'package:routing/application.dart';
import 'package:routing/router.dart';
import 'package:storage/cache.dart';

import 'pages/error_page_widget.dart';
import 'router/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initLocator(dev);

  runApp(
    BlocProvider(
      create: (_) => di<AuthBloc>(),
      child: ApplicationScope(
        analytics: di<Analytics>(),
        logger: di<Logger>(),
        cache: di<ICache>(),
        router: Router(
          onRedirect: onRedirect,
          errorPage: ErrorPageWidget.delegate,
          refreshListenable: di<AuthBloc>().isAuthenticatedListenable(),
          pages: pages,
        ),
        child: Application(
          title: 'Flutter Advanced Boilerplate',
          theme: ThemeData.light(),
        ),
      ),
    ),
  );
}

/// How redirects work for the application.
String? onRedirect(
  BuildContext context, {
  required bool isAuthenticated,
  required RouteInfo info,
}) {
  context.logger.log('isAuthenticated', data: isAuthenticated);
  context.logger.log('Auth state:', data: di<AuthBloc>().state);

  if (!isAuthenticated && info.path != Pages.login.path) {
    return Pages.login.path;
  }

  if (isAuthenticated && info.path == Pages.login.path) {
    return Pages.testA.path;
  }

  return null;
}
