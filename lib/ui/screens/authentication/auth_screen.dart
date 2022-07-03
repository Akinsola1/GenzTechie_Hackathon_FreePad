import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../responsive_screen/responsive.dart';
import 'donor/donor_signUp.dart';
import 'receipient/recipient_signUp.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AuthScreen>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  bool hide = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          final TabController? tabController = DefaultTabController.of(context);
          tabController?.addListener(
            () {
              if (!tabController.indexIsChanging) {}
            },
          );
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Center(
              child: Container(
                width:
                    responsive.isMobile(context) ? size.width : size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBar(
                            indicator: BoxDecoration(
                                color: Colors.green[300],
                                borderRadius: BorderRadius.circular(25.0)),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              Tab(
                                text: 'As Donor',
                              ),
                              Tab(
                                text: 'As Recipient',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                        child: TabBarView(
                      children: [DonorSignUp(), RecipientSignUp()],
                    ))
                  ],
                ),
              ),
            ),
          ));
        }));
  }
}
