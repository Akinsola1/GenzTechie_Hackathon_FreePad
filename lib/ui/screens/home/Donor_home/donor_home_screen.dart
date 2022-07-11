import 'package:flutter/material.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:free_pad/core/respositories.dart/auth_repositories.dart';
import 'package:free_pad/core/respositories.dart/user_repositories.dart';
import 'package:free_pad/ui/responsive_screen/responsive.dart';
import 'package:free_pad/ui/responsive_state/responsive_state.dart';
import 'package:free_pad/ui/screens/home/Donor_home/simple_model.dart';
import 'package:free_pad/ui/screens/home/drawer.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DonorHome extends StatefulWidget {
  DonorHome({Key? key}) : super(key: key);

  @override
  State<DonorHome> createState() => _DonorHomeState();
}

class _DonorHomeState extends State<DonorHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var profile = Provider.of<UserProvider>(context, listen: false);
      profile.getUserData(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dashboardOption> dashboardOptionList = [
      dashboardOption('assets/image/donate.jpg', 'Donate Pad', () {
        Navigator.pushNamed(context, RouteNames.donateScreen);
      }),
      dashboardOption('assets/image/donate.jpg', 'View Previous Donation', () {
        Navigator.pushNamed(context, RouteNames.viewPreviousDOnation);
      }),
    ];
    var profile = Provider.of<UserProvider>(
      context,
    );
    Size size = MediaQuery.of(context).size;
    var data = profile.profile.data;
    var amount = (data?.peopleHelped ?? 0) * 500;
    List<breakDown> breakDownList = [
      breakDown('${data?.peopleHelped}', 'Happy Recipient'),
      breakDown('₦${amount}', 'Amount Donated'),
    ];
    var formatter = NumberFormat('#,###,###');

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: DrawerItem(name: '${data?.name}', email: '${data?.email}'),
      ),
      body: ResponsiveState(
        state: profile.state,
        busyWidget: Center(
          child: const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(strokeWidth: 6)),
        ),
        idleWidget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hello ${data?.name}',
                      style: Theme.of(context).textTheme.headline6),
                  InkWell(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('assets/image/donate.jpg'))),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).iconTheme.color!,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Wallet Balance',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  '₦${formatter.format(double.tryParse('${data?.wallet}') ?? 0.00)}',
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).iconTheme.color,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Fund wallet',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              LayoutBuilder(builder: (_context, constraint) {
                return ResponsiveGridView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    alignment: Alignment.center,
                    gridDelegate: ResponsiveGridDelegate(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        maxCrossAxisExtent: constraint.maxWidth / 2,
                        childAspectRatio:
                            MediaQuery.of(context).size.aspectRatio * 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Column(
                          children: [
                            Text(breakDownList.elementAt(index).amount,
                                style: Theme.of(context).textTheme.headline5),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(breakDownList.elementAt(index).title,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13,
                                )),
                          ],
                        ),
                      );
                    },
                    itemCount: breakDownList.length);
              }),
              const SizedBox(
                height: 20,
              ),
              LayoutBuilder(builder: (_context, constraint) {
                return ResponsiveGridView.builder(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    alignment: Alignment.center,
                    gridDelegate: ResponsiveGridDelegate(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      maxCrossAxisExtent: constraint.maxWidth / 2,
                      childAspectRatio:
                          MediaQuery.of(context).size.aspectRatio * 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: dashboardOptionList.elementAt(index).onPressed,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Theme.of(context).iconTheme.color!)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            dashboardOptionList
                                                .elementAt(index)
                                                .animation,
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dashboardOptionList.elementAt(index).title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: dashboardOptionList.length);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
