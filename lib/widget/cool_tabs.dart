// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_initializing_formals

import 'package:flutter/material.dart';

// Adel's Pill tab widget

class PillTabs extends StatelessWidget {
  PillTabs({
    Key? key,
    required TabController tabController,
    children,
    required this.tab1Text,
    required this.tab2Text,
  })  : _tabController = tabController,
        tabs = <Tab>[
          Tab(text: tab1Text),
          Tab(text: tab2Text),
        ],
        children = children,
        super(key: key);

  final TabController _tabController;
  final String tab1Text;
  final String tab2Text;
  List<Widget> children = <Widget>[];
  List<Tab> tabs = <Tab>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffF4F4F4),
          elevation: 0,
          toolbarHeight: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      tabs: tabs,
                      controller: _tabController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: children,
      ),
    );
  }
}
