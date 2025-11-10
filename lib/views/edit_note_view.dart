import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/custom_appbar.dart';
import 'package:notes_app_using_hive/views/widgets/custom_textfield.dart';

class EditNoteView extends StatelessWidget {
  static const String id = "EditNotesView";
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(TitleText: "Edit Notes", customIcon: Icons.check),
            Column(
              children: [
                SizedBox(height: 30),
                CustomTextfield(
                  labelText: "Title",
                  hintText: "Edit Note Titel ",
                ),
                SizedBox(height: 30),
                CustomTextfield(
                  labelText: "Description",
                  hintText: "Edit Note Description",
                  maxLines: 6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
