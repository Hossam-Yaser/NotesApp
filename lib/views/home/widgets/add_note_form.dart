import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_using_hive/cubits/add_note_cubit/add_note_cubit_cubit.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/home/widgets/colorslistview.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_textfield.dart';

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
  bool isLoading = false;
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
            const SizedBox(height: 20),
            Colorslistview(),
            const SizedBox(height: 40),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.only(bottom: 32),
              child: BlocBuilder<AddNoteCubit, AddNoteCubitState>(
                builder: (context, state) {
                  isLoading = state is AddNoteLoading ? true : false;
                  return FloatingActionButton.extended(
                    backgroundColor: Color(0xff9FCC2E),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var noteModel = NoteModel(
                          title: title!,
                          date: DateFormat(
                            'dd MMM yyyy',
                          ).format(DateTime.now()),
                          subTitle: supTitle!,

                          color: Colors.blueGrey.value,
                        );
                        BlocProvider.of<AddNoteCubit>(
                          context,
                        ).addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },

                    label: isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                    icon: isLoading
                        ? null
                        : const Icon(Icons.save, color: Colors.black),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
