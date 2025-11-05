import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/noteitem_widget.dart';

class Notesitemlistviewwidget extends StatelessWidget {
  const Notesitemlistviewwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return NoteitemWidget();
          },
        ),
      ),
    );
  }
}
