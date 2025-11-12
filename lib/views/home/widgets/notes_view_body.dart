import 'package:flutter/material.dart';
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
          Expanded(child: Notesitemlistviewwidget()),
        ],
      ),
    );
  }
}
