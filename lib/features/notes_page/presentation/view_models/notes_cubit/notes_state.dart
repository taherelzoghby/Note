part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class GetNotesInitial extends NotesState {}

class GetNotesLoaded extends NotesState {
  final List<Note> notes;

  GetNotesLoaded({required this.notes});
}

class GetNotesLoading extends NotesState {}

class GetNotesFailure extends NotesState {
  final String message;

  GetNotesFailure({required this.message});
}

class DeleteAllNotesSuccess extends NotesState {}

class DeleteAllNotesLoading extends NotesState {}

class DeleteAllNotesError extends NotesState {
  final String message;

  DeleteAllNotesError({required this.message});
}

class EditNoteSuccess extends NotesState {}

class EditNoteLoading extends NotesState {}

class EditNoteFailure extends NotesState {
  final String message;

  EditNoteFailure({required this.message});
}
class AddNoteSuccess extends NotesState {}

class AddNoteLoading extends NotesState {}

class AddNoteFailure extends NotesState {
  final String message;

  AddNoteFailure({required this.message});
}
