import 'package:flutter/material.dart';
import 'package:masterindiatask/routes/routes.dart';
import 'package:masterindiatask/routes/routes_generator.dart';

void main() {
  runApp(GstApp());
}

class GstApp extends StatelessWidget {
  const GstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF2da05e)),
      initialRoute: Routes.searchPage,
      onGenerateRoute: RoutesGenerator.generateRoute,
    );
  }
}
