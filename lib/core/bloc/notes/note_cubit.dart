import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/core/repository/sql_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'notes_states.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInital());
  static NotesCubit get(BuildContext context) => BlocProvider.of(context);
  List<Items> items = [];
  //read all notes
  void getNotes() async {
    emit(NotesLoading());
    items = await NotesDatabase.instance.readAllNotes();
    emit(NotesLoaded());
  }

  void insert(Items note) async {
    emit(NotesLoading());
    await NotesDatabase.instance.database;
    NotesDatabase.instance.create(note).then((value) {
      print(value.toString());
      getNotes();
      emit(NotesLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(NotesError());
    });
  }

  void update(Items note) {
    emit(NotesLoading());
    NotesDatabase.instance.update(note).then((value) {
      print(value.toString());
      getNotes();
      emit(NotesLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(NotesError());
    });
  }

  void delete(int id) {
    emit(NotesLoading());
    NotesDatabase.instance.delete(id).then((value) {
      print(value.toString());
      getNotes();
      emit(NotesLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(NotesError());
    });
  }
}
