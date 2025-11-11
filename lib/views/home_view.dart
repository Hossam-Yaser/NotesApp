import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_using_hive/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app_using_hive/views/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  static String id = "Home Screen";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          shape: CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (context) {
                return AddNoteCustomWidget();
              },
            );
          },
          child: Icon(Icons.add, color: Colors.black),
        ),
      ),
    );
  }
}

class AddNoteCustomWidget extends StatefulWidget {
  const AddNoteCustomWidget({super.key});

  @override
  State<AddNoteCustomWidget> createState() => _AddNoteCustomWidgetState();
}

class _AddNoteCustomWidgetState extends State<AddNoteCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.top),
      child: const AddNoteBottomSheet(),
    );
  }
}
