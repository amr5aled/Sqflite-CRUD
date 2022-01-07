abstract class NotesState {
  const NotesState();
}

class NotesInital extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {}

class NotesError extends NotesState {}
