abstract class NotesState {
  const NotesState();
}

class NotesInital extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {}

class NotesError extends NotesState {}

class NotesGetLoaded extends NotesState {}

class NotesEditLoaded extends NotesState {}

class NotesDeleteLoaded extends NotesState {}
