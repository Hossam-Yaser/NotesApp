import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_using_hive/constatnts.dart';
import 'package:notes_app_using_hive/cubits/add_note_cubit/add_note_cubit_cubit.dart';

class Colorslistview extends StatefulWidget {
  const Colorslistview({super.key});

  @override
  State<Colorslistview> createState() => _ColorslistviewState();
}

class _ColorslistviewState extends State<Colorslistview> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          // bool isSelected = currentIndex == index;
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = kColors[index];

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

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.itemColor,
  });
  final bool isSelected;
  final Color itemColor;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 40,
            backgroundColor: Colors.redAccent,
            child: CircleAvatar(radius: 30, backgroundColor: itemColor),
          )
        : CircleAvatar(radius: 34, backgroundColor: itemColor);
  }
}
