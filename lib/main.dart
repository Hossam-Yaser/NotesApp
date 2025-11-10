import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/edit_note_view.dart';
import 'package:notes_app_using_hive/views/home_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),

      debugShowCheckedModeBanner: false,
      routes: _routes,
      initialRoute: HomeView.id,
    );
  }
}

Map<String, Widget Function(BuildContext)> _routes = {
  HomeView.id: (context) => HomeView(),
  EditNoteView.id: (context) => EditNoteView(),
};
