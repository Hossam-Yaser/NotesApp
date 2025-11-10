import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_using_hive/constatnts.dart';
import 'package:notes_app_using_hive/views/edit_note_view.dart';
import 'package:notes_app_using_hive/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kNotes);
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
