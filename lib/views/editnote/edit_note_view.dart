import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/editnote/widgets/editnote_colorslistview.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_appbar.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_textfield.dart';

class EditNoteView extends StatefulWidget {
  static const String id = "EditNotesView";
  const EditNoteView({super.key});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController supTitleController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    NoteModel existingNote =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    titleController.text = existingNote.title;
    supTitleController.text = existingNote.subTitle;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  TitleText: "Edit Notes",
                  customIcon: Icons.check,
                  onPressed: () {
                    final title = titleController.text.trim();
                    final supTitle = supTitleController.text.trim();

                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      existingNote.title = title;
                      existingNote.subTitle = supTitle;
                      existingNote.save();
                      Navigator.pop(context);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      CustomTextfield(
                        labelText: "Title",
                        hintText: "Edit Note Titel",
                        controller: titleController,
                      ),
                      const SizedBox(height: 30),
                      CustomTextfield(
                        labelText: "Description",
                        hintText: "Edit Note Description",
                        maxLines: 6,
                        controller: supTitleController,
                      ),
                      SizedBox(height: 60),
                      EditnoteColorslistview(note: existingNote),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
