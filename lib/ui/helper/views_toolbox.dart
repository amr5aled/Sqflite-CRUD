import 'dart:async';

import 'package:flutter/material.dart';

class ViewsToolbox {
  /// Global way to access the navigator without build context
  /// ## IMPORTANT NOTICE
  /// you must register this key in your App Widget before you use it.
  /// like the following:
  /// ```
  /// MaterialApp
  /// (
  ///   navigatorKey: ViewsToolbox.navigatorKey
  /// )
  /// ## USAGE
  /// ```
  /// ViewsToolbox.navigatorKey.currentState.push()
  /// ```
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Returns a widget that when it's tapped it dismisses the keyboard if opened
  static Widget dismissKeyboardWidget({
    required Widget child,
    required BuildContext context,
    VoidCallback? callback,
  }) {
    return GestureDetector(
      onTap: () {
        dismissKeyboard(context);
        if (callback != null) callback();
      },
      child: child,
    );
  }

  /// Dismisses the keyboard if opened
  static void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Safe way to navigate away inside the build method
  /// ## HINT
  /// this is to avoid build trap made by the BloC pattern
  static void safeNavigate(PageRoute<dynamic> route, {bool replace = true}) {
    Future<dynamic>.delayed(const Duration(milliseconds: 1), () {
      if (replace) {
        navigatorKey.currentState!.pushReplacement(route);
      } else {
        navigatorKey.currentState!.push(route);
      }
    });
  }
}
