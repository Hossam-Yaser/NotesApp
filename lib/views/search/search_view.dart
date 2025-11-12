import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/editnote/edit_note_view.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_appbar.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_textfield.dart';
import 'package:notes_app_using_hive/views/home/widgets/noteitem_widget.dart';

class SearchView extends StatefulWidget {
  static String id = 'Search View';
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<NoteModel> searchResultNotes = [];
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String searchQuary = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomAppbar(
                TitleText: "Search",
                customIcon: Icons.cancel,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Form(
                  key: formKey,
                  child: CustomTextfield(
                    labelText: "Search",
                    hintText: "Search By Title",
                    onChanged: (value) {
                      searchQuary = value;
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        searchResultNotes = BlocProvider.of<NotesCubit>(
                          context,
                        ).searchNotes(searchQuary);
                        setState(() {});
                      } else {
                        searchResultNotes = [];
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              if (searchResultNotes.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: searchResultNotes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            EditNoteView.id,
                            arguments: searchResultNotes[index],
                          );
                        },
                        child: NoteitemWidget(note: searchResultNotes[index]),
                      );
                    },
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 16, right: 16),
                  child: Text(
                    "No matching notes found.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 32, color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
