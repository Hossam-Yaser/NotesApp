import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/widgets/custom_search_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Text(
            "Note",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          CustomSearchIcon(),
        ],
      ),
    );
  }
}
