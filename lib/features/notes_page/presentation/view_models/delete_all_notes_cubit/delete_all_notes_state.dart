part of 'delete_all_notes_cubit.dart';

@immutable
abstract class DeleteAllNotesState {}

class DeleteAllNotesInitial extends DeleteAllNotesState {}

class DeleteAllNotesSuccess extends DeleteAllNotesState {}

class DeleteAllNotesLoading extends DeleteAllNotesState {}

class DeleteAllNotesError extends DeleteAllNotesState {
  final String message;

  DeleteAllNotesError({required this.message});
}
