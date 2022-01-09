import '../../models/item_model.dart';
import '../../repository/sql_helper.dart';
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
    print(items);
    emit(NotesLoaded());
  }

//isert item
  void insert(Items note) async {
    NotesDatabase.instance.create(note).then((value) {
      emit(NotesGetLoaded());
    }).catchError((error) {
      emit(NotesError());
    });
  }
  //update item

  void update(Items note) {
    NotesDatabase.instance.update(note).then((value) {
      emit(NotesEditLoaded());
    }).catchError((error) {
      emit(NotesError());
    });
  }

//delete item
  void delete(int id) {
    NotesDatabase.instance.delete(id).then((value) {
      emit(NotesDeleteLoaded());
    }).catchError((error) {
      emit(NotesError());
    });
  }

  void closeDatabase() async {
    await NotesDatabase.instance.close();
  }
}
