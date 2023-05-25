import 'package:flutter/material.dart';
import 'package:movie_app/core/router/router.dart' as router;
import 'injector/injector.dart' as dl;

void main() async {
  await dl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.Router().generateAppRoutes,
    );
  }
}
