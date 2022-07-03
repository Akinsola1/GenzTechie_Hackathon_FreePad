// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final String email;
  const DrawerItem({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: ListView(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).iconTheme.color!,
                ),
                image: DecorationImage(
                    image: AssetImage('assets/image/donate.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Center(
            child: Text(email,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 13,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RouteNames.login, (Route<dynamic> route) => false);
              },
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
