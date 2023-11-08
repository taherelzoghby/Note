import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/services/service_locator.dart';
import 'package:note_3/features/add_note_page/presentation/view_models/add_note_cubit/add_note_cubit.dart';
import 'package:note_3/features/add_note_page/presentation/views/add_note_view.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo_imple.dart';
import 'package:note_3/features/edit_note_page/presentation/view/edit_note_view.dart';
import 'package:note_3/features/edit_note_page/presentation/view_model/edit_note_cubit/update_note_cubit.dart';
import 'package:note_3/features/notes_page/presentation/views/notes_page_view.dart';
import 'package:note_3/features/splash/presentation/view/splash_view.dart';

import '../../features/add_note_page/data/repos/add_note_page_repo/add_note_repo_imple.dart';

class AppGoRouter {
  static const String splashPath = '/';
  static const String homePath = '/home';
  static const String addNotePath = '/addNote';
  static const String editNotePath = '/EditNote';
  static final GoRouter routes = GoRouter(
    routes: [
      ///splash
      GoRoute(
        path: splashPath,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      ///home
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) {
          return const NotesView();
        },
      ),

      ///add note page
      GoRoute(
        path: addNotePath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => AddNoteCubit(
              addNotePageRepo: getIt.get<AddNoteRepoImplementation>(),
            ),
            child: const AddNoteView(),
          );
        },
      ),

      ///edit note page
      GoRoute(
        path: editNotePath,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => UpdateNoteCubit(
              editNotePageRepo: getIt.get<EditNoteRepoImplementation>(),
            )..init(note: state.extra as Note),
            child: EditNoteView(note: state.extra as Note),
          );
        },
      ),
    ],
  );
}
