import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMainBlocProvider extends StatelessWidget {
  const AppMainBlocProvider({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider(create: (context) => NotesCubit()),
      ],
      child: child!,
    );
  }
}
