part of 'get_notes_cubit.dart';

@immutable
abstract class GetNotesState {}

class GetNotesInitial extends GetNotesState {}

class GetNotesLoaded extends GetNotesState {
  final List<Note> notes;

  GetNotesLoaded({required this.notes});
}

class GetNotesLoading extends GetNotesState {}

class GetNotesFailure extends GetNotesState {
  final String message;

  GetNotesFailure({required this.message});
}
