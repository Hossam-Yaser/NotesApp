import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/edit_note_view.dart';
import 'package:notes_app_using_hive/views/widgets/noteitem_widget.dart';

class Notesitemlistviewwidget extends StatelessWidget {
  const Notesitemlistviewwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<NotesCubit>(
            context,
          ).fetchAllNotes();
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(EditNoteView.id);
                },
                child: NoteitemWidget(
                  title: notes[index].title,
                  suptitle: notes[index].subTitle,
                  dateTime: notes[index].date.trimRight(),
                  color: notes[index].color,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
