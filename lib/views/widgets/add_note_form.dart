import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title;
  String? supTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextfield(
              onSaved: (value) {
                title = value;
              },
              labelText: "Title",
              hintText: "Write Note Titel ",
            ),
            const SizedBox(height: 30),
            CustomTextfield(
              onSaved: (value) {
                supTitle = value;
              },
              labelText: "Description",
              hintText: "Write Note Description",
              maxLines: 6,
            ),
            const SizedBox(height: 50),
            FloatingActionButton.extended(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var noteModel = NoteModel(
                    title: title!,
                    subTitle: supTitle!,
                    date: DateTime.now().toString(),
                    color: Colors.amber.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              label: Text(
                "Add",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
