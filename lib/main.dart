import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/core/consts/strings.dart';
import 'package:note_3/core/consts/style.dart';
import 'package:note_3/core/helper/cache_helper.dart';
import 'package:note_3/core/services/service_locator.dart';
import 'package:note_3/features/add_note_page/data/repos/add_note_page_repo/add_note_repo_imple.dart';
import 'package:note_3/features/edit_note_page/data/repos/edit_note_repo/edit_note_repo_imple.dart';
import 'package:note_3/features/notes_page/data/repos/notes_repo_impl.dart';
import 'package:note_3/features/notes_page/presentation/view_models/chaneg_lang_cubit/change_lanuage_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:note_3/generated/l10n.dart';
import 'package:note_3/observer_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///observe
  runZoned(() => Bloc.observer = ObserverCubit());

  ///init shared preferences
  await CacheHelper.init();

  ///setup service locator
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ///get all notes cubit
        BlocProvider(
          create: (context) => NotesCubit(
            notesRepo: getIt.get<NotesRepoImplementation>(),
            editNoteRepo: getIt.get<EditNoteRepoImplementation>(),
            addNotePageRepo: getIt.get<AddNoteRepoImplementation>(),
          ),
        ),

        ///search cubit
        BlocProvider(
          create: (context) => SearchCubit(),
        ),

        ///update language cubit
        BlocProvider(
          create: (context) => ChangeLanuageCubit(const Locale('en')),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 851),
        builder: (BuildContext context, Widget? widget) {
          return BlocBuilder<ChangeLanuageCubit, Locale>(
            builder: (context, locale) {
              return MaterialApp.router(
                title: "Note",
                routerConfig: AppGoRouter.routes,
                debugShowCheckedModeBanner: false,
                locale: CacheHelper.getData(key: StringsEn.lang) == null
                    ? locale
                    : Locale(CacheHelper.getData(key: StringsEn.lang)),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: ThemeData(
                  floatingActionButtonTheme:
                      const FloatingActionButtonThemeData(
                    backgroundColor: AppConsts.mainColor,
                  ),
                  appBarTheme: const AppBarTheme(color: AppConsts.mainColor),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
