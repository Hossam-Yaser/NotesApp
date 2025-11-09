import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/custom_appbar.dart';
import 'package:notes_app_using_hive/views/widgets/noteslistview_widget.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [CustomAppbar(), Notesitemlistviewwidget()]),
    );
  }
}
