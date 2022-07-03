// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AppbarWithTabs extends StatelessWidget {
  AppbarWithTabs({
    Key? key,
    required TabController tabController,
    tabs,
    required this.tab1Text,
    required this.tab2Text,
  })  : _tabController = tabController,
        tabs = <Tab>[
          Tab(text: tab1Text),
          Tab(text: tab2Text),
        ],
        super(key: key);

  final TabController _tabController;
  final String tab1Text;
  final String tab2Text;

  List<Tab> tabs = <Tab>[];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 60,
              child: Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF4F4F4),
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: tabs,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
