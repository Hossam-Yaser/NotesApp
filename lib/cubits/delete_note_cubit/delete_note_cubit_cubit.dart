import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delete_note_cubit_state.dart';

class DeleteNoteCubitCubit extends Cubit<DeleteNoteCubitState> {
  DeleteNoteCubitCubit() : super(DeleteNoteCubitInitial());
}
