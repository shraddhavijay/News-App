import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:newsapp/theme/colors.dart';
import 'package:newsapp/widgets/listOfNews.dart';
import 'package:newsapp/widgets/textStyles.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomePage> with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Popular"),
    new Tab(text: "Latest"),
    new Tab(text: "Corona"),
    new Tab(text: "Politics"),
    new Tab(text: "Business"),
    new Tab(text: "Education"),
    new Tab(text: "Stock Market"),
    new Tab(text: "Fashion"),
    new Tab(text: "Television"),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: newsTitle("World News",22),
        backgroundColor: appbarColor,
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: tabBarunSelectedLabelColor,
          labelColor: tabBarLabelColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 35.0,
            indicatorColor: appbarTextColor,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: tabs.map((Tab tab) {
          return ListOfNews(
            category: tab.text,
          );
        }).toList(),
      ),
    );
  }
}
