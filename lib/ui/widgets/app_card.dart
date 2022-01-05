import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? child;

  const AppCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: child!);
  }
}
