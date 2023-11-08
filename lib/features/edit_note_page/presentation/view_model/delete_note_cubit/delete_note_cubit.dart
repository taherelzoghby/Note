import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  EditNotePageRepo editNoteRepo;

  DeleteNoteCubit({required this.editNoteRepo}) : super(DeleteNoteInitial());

  ///delete note
  deleteNote({required Note note}) async {
    int result = await editNoteRepo.deleteNote(note: note);
  }
}
