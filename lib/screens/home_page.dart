import 'package:animated_tab_bar/models/tab_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TabModel> tabs = [
    TabModel(
      title: 'CODIFICACIONES',
      bgColor: const Color(0xff004c59),
      tabColor: const Color(0xff01dcff),
    ),
    TabModel(
      title: 'MODULACIONES',
      bgColor: const Color(0xff341295),
      tabColor: const Color(0xffbd00ff),
    ),
    TabModel(
      title: 'Polar',
      bgColor: const Color.fromARGB(255, 140, 149, 18),
      tabColor: const Color.fromARGB(255, 255, 251, 0),
    ),
  ];

  late List<GlobalKey> tabKeys = [];
  late Size tabSize;
  late TabModel _selectedTab;
  late int _selectedTabIndex;

  @override
  void initState() {
    tabKeys = List.generate(tabs.length, (index) => GlobalKey());
    _selectedTabIndex = 0;
    tabSize = Size.zero;
    _selectedTab = tabs[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final double containerWidth = tabSize.width;
    final double xPos = _selectedTabIndex * containerWidth;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.ease,
        height: height,
        width: double.infinity,
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
              SizedBox(
                width: double.infinity,
                height: height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        tabs.length,
                        (x) => Expanded(
                          child: GestureDetector(
                            onTap: () {
                              _selectedTabIndex = x;
                              _selectedTab = tabs[x];
                              if (tabKeys[x].currentContext != null) {
                                tabSize = tabKeys[x].currentContext!.size!;
                              }
                              setState(() {});
                            },
                            child: Text(
                              tabs[x].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      height: height * 0.01,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff002329),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: List.generate(
                          tabs.length,
                          (x) => Expanded(
                            key: tabKeys[x],
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.ease,
                              transform: Matrix4.identity()..translate(xPos),
                              decoration: BoxDecoration(
                                color: x == 0
                                    ? _selectedTab.tabColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
