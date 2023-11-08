import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:note_3/core/consts/app_router.dart';
import 'package:note_3/features/notes_page/presentation/view_models/notes_cubit/notes_cubit.dart';
import 'package:note_3/features/notes_page/presentation/view_models/search_cubit/search_cubit.dart';
import 'package:note_3/features/notes_page/presentation/views/widgets/notes_process.dart';
import 'package:note_3/generated/l10n.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    ///get notes
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width.h, size.height * .07.w),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            SearchCubit bloc = BlocProvider.of<SearchCubit>(context);
            return Center(
              child: AppBar(
                automaticallyImplyLeading: false,
                title: bloc.buildAppBarTitle(context),
                centerTitle: true,
                actions: bloc.buildAppBarActions(context),
              ),
            );
          },
        ),
      ),
      body: const NotesProcess(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => GoRouter.of(context).push(AppGoRouter.addNotePath),
        label: Text(S.of(context).add_note),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
