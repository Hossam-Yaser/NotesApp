import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_using_hive/constatnts.dart';
import 'package:notes_app_using_hive/models/note_model.dart';

part 'add_note_cubit_state.dart';

class AddNoteCubit extends Cubit<AddNoteCubitState> {
  AddNoteCubit() : super(AddNoteCubitInitial());

  int color = kColors.first;

  addNote(NoteModel note) async {
    note.color = color;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotes);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNotefailure(errorMessage: e.toString()));
    }
  }
}
