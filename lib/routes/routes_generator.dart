import 'package:flutter/material.dart';
import 'package:masterindiatask/routes/routes.dart';

import '../model/gst_user.dart';
import '../pages/details.dart';
import '../pages/search.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.searchPage:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case Routes.viewDetailsPage:
        return MaterialPageRoute(
            builder: (_) => DetailPage(
                  data: (settings.arguments as GstUserModel),
                ),
            settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: Text("Error Route"),
                  ),
                ));
    }
  }
}
