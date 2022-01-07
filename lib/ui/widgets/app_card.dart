import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget? child;

  const AppCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: child!);
  }
}
