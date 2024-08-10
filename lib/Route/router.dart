import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_vendor/Route/routeNames.dart';
import 'package:new_vendor/homescreen.dart';
import 'package:new_vendor/homescreen01.dart';
import 'package:new_vendor/login.dart';

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Login_Rt:
      return _getPageRoute(login());
    case HomeScrn_Rt:
      return _getPageRoute(homeScreen());
    default:
      return _getPageRoute(homeScreen());
  }
}
