import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/widgets/dialog.dart';
import 'package:note_3/core/widgets/text_field.dart';
import 'package:note_3/features/notes_page/presentation/view_models/chaneg_lang_cubit/change_lanuage_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/generated/l10n.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<Note> searchedList = [];
  TextEditingController textSearching = TextEditingController();
  bool isSearching = false;

  ///build appbar
  Widget buildAppBarTitle(BuildContext context) {
    if (isSearching == true) {
      return CustomTextField(
        hint: S.of(context).search,
        style: AppConsts.style18,
        hintStyle: AppConsts.style18.copyWith(color: AppConsts.white),
        controller: textSearching,
        onChanged: (String value) => _searchNote(value, context),
      );
    } else {
      return Text(S.of(context).notes);
    }
  }

  ///filtering note method
  _searchNote(String value, BuildContext context) {
    List<Note> allNotes = BlocProvider.of<NotesCubit>(context).notes;
    searchedList = allNotes
        .where((element) =>
            element.title!.startsWith(value) ||
            element.content!.startsWith(value))
        .toList();
    emit(FilteringSearch(filteringSearch: searchedList));
  }

  ///build appbar actions
  List<Widget> buildAppBarActions(BuildContext context) {
    if (isSearching == true) {
      return [
        IconButton(
          onPressed: () {
            ///stop  searching
            stopSearching();

            ///back
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () => _startSearchAppBar(context),
          icon: const Icon(Icons.search),
        ),

        ///delete all database
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          onSelected: (val) {
            if (val == 0) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                    contentText: S.of(context).areYouSureDeleteAllNotes,
                    confirmFunction: () {
                      ///delete all databases
                      BlocProvider.of<NotesCubit>(context)
                          .deleteAllNotes();

                      ///get Notes
                      BlocProvider.of<NotesCubit>(context).getNotes();

                      ///go back
                      GoRouter.of(context)
                          .pushReplacement(AppGoRouter.homePath);
                    },
                    declineFunction: () => GoRouter.of(context).pop(),
                  );
                },
              );
            } else if (val == 1) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                    contentText: S.of(context).areYouSureChangeLang,
                    confirmFunction: () {
                      ///change Language
                      BlocProvider.of<ChangeLanuageCubit>(context)
                          .updateLang(context);
                      GoRouter.of(context).pop();
                      GoRouter.of(context).replace(AppGoRouter.splashPath) ;
                    },
                    declineFunction: () => GoRouter.of(context).pop(),
                  );
                },
              );
            }
          },
          itemBuilder: (context) => [
            ///delete all notes
            PopupMenuItem(
              value: 0,
              child: Text(
                S.of(context).deleteAllNotes,
                style: AppConsts.style21.copyWith(fontSize: 18),
              ),
            ),

            ///updated lang
            PopupMenuItem(
              value: 1,
              child: Text(
                S.of(context).lang,
                style: AppConsts.style21.copyWith(fontSize: 18),
              ),
            ),
          ],
        ),
      ];
    }
  }

  ///stop searching
  stopSearching() {
    textSearching.clear();
    isSearching = false;
    emit(NotSearching());
  }

  ///start searching appBar
  _startSearchAppBar(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: stopSearching(),
      ),
    );
    isSearching = true;
    emit(Searching());
  }
}
