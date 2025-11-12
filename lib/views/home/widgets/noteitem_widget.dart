import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_using_hive/models/note_model.dart';

class NoteitemWidget extends StatelessWidget {
  const NoteitemWidget({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(note.color),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              note.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                note.subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
              icon: const Icon(Icons.delete, size: 30, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              note.date,
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
