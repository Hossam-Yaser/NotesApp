import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_note_cubit_state.dart';

class EditNoteCubitCubit extends Cubit<EditNoteCubitState> {
  EditNoteCubitCubit() : super(EditNoteCubitInitial());
}
