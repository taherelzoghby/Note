import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo.dart';

part 'delete_all_notes_state.dart';

class DeleteAllNotesCubit extends Cubit<DeleteAllNotesState> {
  NotesRepo notesRepo;

  DeleteAllNotesCubit({required this.notesRepo})
      : super(DeleteAllNotesInitial());

  ///delete all notes
  deleteAllNotes() async {
    try {
      emit(DeleteAllNotesLoading());
      await notesRepo.deleteDatabases();
      emit(DeleteAllNotesSuccess());
    } catch (e) {
      emit(DeleteAllNotesError(message: e.toString()));
    }
  }
}
