part of 'update_note_cubit.dart';

@immutable
abstract class UpdateNoteState {}

class UpdateNoteInitial extends UpdateNoteState {}

class EditNoteSuccess extends UpdateNoteState {}

class EditNoteLoading extends UpdateNoteState {}

class EditNoteFailure extends UpdateNoteState {
  final String message;

  EditNoteFailure({required this.message});
}
