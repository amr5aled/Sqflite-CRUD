import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/ui/resources/app_routes.dart';
import 'package:crudsqlite/ui/screens/addNotes/add_notes.dart';
import 'package:crudsqlite/ui/screens/home/home_screen.dart';
import 'package:crudsqlite/ui/screens/productsDetails/productDetails_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final dynamic args = settings.arguments;
    switch (settings.name) {

      // Home Screen
      case AppRoute.home:
        return _screenInit(const HomeScreen());
      //AddNotes
      case AppRoute.notes:
        return _screenInit(AddNotes(
          isEdit: args as bool,
        ));
      //ProductDetailScreen
      case AppRoute.details:
        return _screenInit(ProductDetailScreen(
          items: args as Items,
        ));

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(Widget screen) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static CupertinoPageRoute<dynamic> _screenPresent(Widget screen) {
    return CupertinoPageRoute<dynamic>(
      fullscreenDialog: true,
      builder: (_) => screen,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
