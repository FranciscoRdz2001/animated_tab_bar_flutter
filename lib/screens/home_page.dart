import 'package:animated_tab_bar/models/tab_model.dart';
import 'package:animated_tab_bar/widgets/custom_animated_tab_bar/animated_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TabModel> _tabs = [
    TabModel(
      title: 'Test1',
      bgColor: const Color(0xff004c59),
      tabColor: const Color(0xff01dcff),
    ),
    TabModel(
      title: 'Test2',
      bgColor: const Color(0xff341295),
      tabColor: const Color(0xffbd00ff),
    ),
  ];

  late TabModel _selectedTab;

  @override
  void initState() {
    _selectedTab = _tabs[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              _selectedTab.bgColor,
              const Color(0xff131414),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            children: [
              AnimatedTabBar(
                tabs: _tabs,
                height: height * 0.1,
                sliderHeight: height * 0.01,
                initialTabIndex: 0,
                onNewTabIsSelected: (tab, index) {
                  setState(() {
                    _selectedTab = tab;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
