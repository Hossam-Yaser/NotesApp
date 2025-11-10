import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchIcon extends StatelessWidget {
  late IconData customIcon;
  void Function()? onPressed;
  CustomSearchIcon({required this.customIcon, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(customIcon, size: 30),
        ),
      ),
    );
  }
}
