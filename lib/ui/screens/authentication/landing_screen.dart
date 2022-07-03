import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:free_pad/ui/size_config/sizeConfig.dart';
import 'package:free_pad/ui/theme/theme.dart';
import 'package:free_pad/widget/custom_appbar.dart';
import 'package:free_pad/widget/custom_switch.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool status = false;


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'LEENKS',
                    style:Theme.of(context).textTheme.headline6
                  ),
                  Spacer(),
                  Row(
                    children: [
                      FlutterSwitch(
                        width: 40.0,
                        height: 20,
                        valueFontSize: 12.0,
                        toggleSize: 20.0,
                        value: status,
                        borderRadius: 30.0,
                        padding: 2.0,
                        activeIcon: Icon(Icons.dark_mode_outlined, color:  Theme.of(context).primaryColor),
                        inactiveIcon:Icon(Icons.light_mode_outlined, color:  Theme.of(context).primaryColor), 
                        toggleColor: Colors.white,
                        activeToggleColor: Theme.of(context).iconTheme.color,
                        inactiveColor: Colors.grey,
                        activeColor: Colors.grey,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                            if (val) {
                              model.setDarkMode();
                            } else {
                              model.setLightMode();
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(onTap: () {
                        Navigator.pushNamed(context, RouteNames.loginScreen);
                      },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 15, decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(), 
            Center(
                child: Text(
              'ONE LINK FOR ALL...',
              style: Theme.of(context).textTheme.headline2,
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
