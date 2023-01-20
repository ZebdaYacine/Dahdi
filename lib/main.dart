import 'package:flutter/material.dart';
import 'Routing/AppRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appRouting = AppRoute();
    return MaterialApp.router(
      routerConfig: appRouting.router,
    );
  }
}