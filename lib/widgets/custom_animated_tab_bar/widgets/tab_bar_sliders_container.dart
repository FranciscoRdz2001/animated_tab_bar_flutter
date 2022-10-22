import 'package:animated_tab_bar/models/tab_model.dart';
import 'widgets.dart';
import 'package:flutter/material.dart';

class TabBarSlidersContainer extends StatelessWidget {
  final List<TabModel> tabs;
  final List<GlobalKey> keys;
  final Color selectedColor;
  final double height;
  final double selectedTabXPos;
  const TabBarSlidersContainer({
    super.key,
    required this.height,
    required this.tabs,
    required this.keys,
    required this.selectedColor,
    required this.selectedTabXPos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xff002329),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
          (x) => TabSlider(
            tabKey: keys[x],
            transform: Matrix4.identity()..translate(selectedTabXPos),
            duration: 350,
            color: x == 0 ? selectedColor : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
