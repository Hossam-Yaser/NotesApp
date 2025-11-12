import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app_using_hive/constatnts.dart';
import 'package:notes_app_using_hive/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];
  List<NoteModel> searchResult = [];
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotes);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }

  // searchNotes(String searchByTitle) {
  //   for (int i = 0; i < notes!.length; i++) {
  //     if (notes![i].title.contains(searchByTitle)) {
  //       searchResult.add(notes![i]);
  //     }
  //   }
  //   return searchResult;
  // }
  searchNotes(String searchByTitle) {
    final box = Hive.box<NoteModel>('notes_hive');
    final filteredNotes = box.values.where((note) {
      return note.title.toLowerCase().contains(searchByTitle.toLowerCase());
    }).toList();

    return filteredNotes;
  }
}
