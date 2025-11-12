import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/constatnts.dart';
import 'package:notes_app_using_hive/models/note_model.dart';
import 'package:notes_app_using_hive/views/home/widgets/colorslistview.dart';

class EditnoteColorslistview extends StatefulWidget {
  const EditnoteColorslistview({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditnoteColorslistview> createState() => _EditnoteColorslistviewState();
}

class _EditnoteColorslistviewState extends State<EditnoteColorslistview> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    currentIndex = kColors.indexWhere((color) => color == widget.note.color);

    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = kColors[index];
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: ColorItem(
                isSelected: currentIndex == index,

                itemColor: Color(kColors[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
