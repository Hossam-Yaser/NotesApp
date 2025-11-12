import 'package:flutter/material.dart';
import 'package:notes_app_using_hive/views/home/widgets/custom_search_icon.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  late String? TitleText;
  late IconData customIcon;
  void Function()? onPressed;
  CustomAppbar({
    required this.TitleText,
    this.customIcon = Icons.search,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Text(
            TitleText!,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          CustomSearchIcon(customIcon: customIcon, onPressed: onPressed),
        ],
      ),
    );
  }
}
