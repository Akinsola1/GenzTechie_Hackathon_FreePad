import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_pad/core/respositories.dart/user_repositories.dart';
import 'package:free_pad/ui/responsive_state/responsive_state.dart';
import 'package:free_pad/ui/screens/home/drawer.dart';
import 'package:provider/provider.dart';

class RecipientHome extends StatefulWidget {
  const RecipientHome({Key? key}) : super(key: key);

  @override
  State<RecipientHome> createState() => _RecipientHomeState();
}

class _RecipientHomeState extends State<RecipientHome> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); 

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
    var profile = Provider.of<UserProvider>(
      context,
    );
    Size size = MediaQuery.of(context).size;
    var data = profile.profile.data;

    return Scaffold(
       key: _key, 
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: DrawerItem(name: '${data?.name}', email: '${data?.email}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ResponsiveState(
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
                        style: Theme.of(context).textTheme.bodyText1),
                    InkWell(
                      onTap: () => _key.currentState!.openDrawer(),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Request Count',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('0',
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            ),
                            ResponsiveState(
                                state: profile.state,
                                busyWidget: const SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 6)),
                                idleWidget: InkWell(
                                  onTap: () {
                                    profile.makeDonationRequest();
                                  },
                                  child: MouseRegion(
                cursor: SystemMouseCursors.click,

                                    child: Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).iconTheme.color,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          'Request',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MouseRegion(
                cursor: SystemMouseCursors.click,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Get your FreePad at ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: data?.pharmacy,
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
