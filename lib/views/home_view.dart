import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/custom_textfield.dart';
import 'package:notes_app_using_hive/views/widgets/notes_view_body.dart';

class HomeView extends StatelessWidget {
  static String id = "Home Screen";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
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
              return AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
                  //  Makes it scrollable when keyboard appears
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        //  Keeps it around half screen when keyboard is hidden
                        maxHeight: MediaQuery.of(context).size.height * 0.5,
                      ),
                      child: const AddNoteBottomSheet(),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomTextfield(labelText: "Title", hintText: "Write Note Titel "),
          SizedBox(height: 30),
          CustomTextfield(
            labelText: "Description",
            hintText: "Write Note Description",
            maxLines: 6,
          ),
          SizedBox(height: 50),
          FloatingActionButton.extended(
            onPressed: () {},
            label: Text(
              "Add",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
