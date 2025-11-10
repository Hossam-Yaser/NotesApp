part of 'add_note_cubit_cubit.dart';

abstract class AddNoteCubitState {}

class AddNoteCubitInitial extends AddNoteCubitState {}

class AddNoteLoading extends AddNoteCubitState {}

class AddNoteSuccess extends AddNoteCubitState {}

class AddNotefailure extends AddNoteCubitState {
  final String errorMessage;
  AddNotefailure({required this.errorMessage});
}
