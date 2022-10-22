import 'package:animated_tab_bar/models/tab_model.dart';
import 'package:animated_tab_bar/widgets/custom_animated_tab_bar/widgets/tab_title.dart';
import 'package:flutter/material.dart';

import 'widgets/tab_bar_sliders_container.dart';

class AnimatedTabBar extends StatefulWidget {
  final Function(TabModel tab, int index) onNewTabIsSelected;
  final List<TabModel> tabs;
  final double height;
  final double sliderHeight;
  final int initialTabIndex;
  const AnimatedTabBar({
    super.key,
    required this.tabs,
    required this.height,
    required this.sliderHeight,
    required this.initialTabIndex,
    required this.onNewTabIsSelected,
  });

  @override
  State<AnimatedTabBar> createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar> {
  late List<GlobalKey> _tabKeys = [];
  late Size _tabSize;
  late TabModel _selectedTab;
  late int _selectedTabIndex;

  @override
  void initState() {
    _tabKeys = List.generate(widget.tabs.length, (x) => GlobalKey());
    _selectedTabIndex = widget.initialTabIndex;
    _tabSize = Size.zero;
    _selectedTab = widget.tabs[widget.initialTabIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double xPos = _selectedTabIndex * _tabSize.width;
    return SizedBox(
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              widget.tabs.length,
              (x) => TabTitle(
                title: widget.tabs[x].title,
                onTapCallback: () {
                  if (_tabKeys[x].currentContext != null) {
                    _tabSize = _tabKeys[x].currentContext!.size!;
                  }
                  setState(() {
                    _selectedTabIndex = x;
                    _selectedTab = widget.tabs[x];
                    widget.onNewTabIsSelected(_selectedTab, x);
                  });
                },
              ),
            ),
          ),
          SizedBox(height: widget.height * 0.1),
          TabBarSlidersContainer(
            height: widget.sliderHeight,
            tabs: widget.tabs,
            keys: _tabKeys,
            selectedColor: _selectedTab.tabColor,
            selectedTabXPos: xPos,
          )
        ],
      ),
    );
  }
}
