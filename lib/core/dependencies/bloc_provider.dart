import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMainBlocProvider extends StatelessWidget {
   const AppMainBlocProvider({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<NotesCubit>(create: (context) => NotesCubit()),
      ],
      child: child!,
    );
  }
}
