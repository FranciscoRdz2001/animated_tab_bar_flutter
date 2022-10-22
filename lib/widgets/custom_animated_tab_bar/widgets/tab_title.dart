import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  final VoidCallback onTapCallback;
  final String title;
  const TabTitle({super.key, required this.title, required this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTapCallback,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
