import 'package:flutter/material.dart';
import 'package:routing/page.dart';

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({super.key, this.exception});

  static ErrorPage delegate = ErrorPage(
    name: ErrorPageWidget.name,
    path: ErrorPageWidget.path,
    builder: (context, exception) => ErrorPageWidget(exception: exception),
  );

  static const String name = 'Error';
  static const String path = '/error';

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
/*     context.page.logger.e('Exception was called', exception: exception); */
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Page'),
      ),
      body: Center(
        child: Text('Error Message: $exception'),
      ),
    );
  }
}
