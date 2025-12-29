import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData buttonIcon;
  final void Function () buttonAction;

  AppBarButton({super.key,
    required this.buttonIcon,
    required this.buttonAction});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: buttonAction,
      icon: Icon(
        buttonIcon,
        size: 25,
        color: Colors.black,
      ),
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey[300],
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(12),
      ),
    );
  }


}
