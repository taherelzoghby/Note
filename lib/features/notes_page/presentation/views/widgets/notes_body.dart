import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:note_3/core/models/note.dart';
import 'package:note_3/core/widgets/noteTile.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: NoteTile(note: notes[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
