import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_appbar.dart';
import 'package:notes_app_using_hive/views/home/widgets/noteslistview_widget.dart';
import 'package:notes_app_using_hive/views/search/search_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppbar(
            TitleText: "Notes",
            onPressed: () {
              Navigator.pushNamed(context, SearchView.id);
            },
          ),
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              final notes = BlocProvider.of<NotesCubit>(context).notes;

              if (notes.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Center(
                    child: Text(
                      "Welcome \nLet's add some notes",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                );
              } else {
                return Expanded(child: Notesitemlistviewwidget());
              }
            },
          ),
        ],
      ),
    );
  }
}
