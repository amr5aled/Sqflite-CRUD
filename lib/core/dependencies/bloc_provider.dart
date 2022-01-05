import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppMainBlocProvider extends StatelessWidget {
  AppMainBlocProvider({this.child});
 
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
      
      ],
      child: child!,
    );
  }
}
