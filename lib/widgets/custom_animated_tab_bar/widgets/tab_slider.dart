import 'package:flutter/material.dart';

class TabSlider extends StatelessWidget {
  final Color color;
  final GlobalKey tabKey;
  final Matrix4 transform;
  final int duration;
  const TabSlider({
    super.key,
    required this.color,
    required this.tabKey,
    required this.transform,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: tabKey,
      child: AnimatedContainer(
        duration: Duration(milliseconds: duration),
        curve: Curves.ease,
        transform: transform,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
