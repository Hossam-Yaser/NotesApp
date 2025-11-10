import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/custom_textfield.dart';
import 'package:notes_app_using_hive/views/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  static String id = "Home Screen";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 12, left: 12, top: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            //  Keeps it around half screen when keyboard is hidden
            maxHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          child: const AddNoteBottomSheet(),
        ),
      ),
    );
  }
}

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(16), child: AddNoteForm());
  }
}

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
                } else {
                  autovalidateMode = AutovalidateMode.always;
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
