import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_pad/api/data_models/api_response.dart';
import 'package:free_pad/api/data_models/auth_response/login_response.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:free_pad/core/respositories.dart/auth_repositories.dart';
import 'package:free_pad/ui/responsive_screen/responsive.dart';
import 'package:free_pad/ui/responsive_state/responsive_state.dart';
import 'package:free_pad/widget/custom_button.dart';
import 'package:free_pad/widget/custom_textfield.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool hide = true;
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Center(
          child: Container(
            width: responsive.isDesktop(context) || responsive.isTablet(context)
                ? size.width / 2.7
                : size.width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Login', style: Theme.of(context).textTheme.headline6),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomTextField(
                      hintText: 'example@leenks.com',
                      labelText: 'Email',
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 60,
                    child: CustomTextField(
                      hintText: '********',
                      labelText: 'Password',
                      controller: passwordController,
                      obscureText: hide,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ResponsiveState(
                    state: authProv.state,
                    busyWidget: const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(strokeWidth: 6)),
                    idleWidget: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () async {
                              LoginResponse response = await  authProv.login(emailController.text, passwordController.text);
                              if (response.status == 200) {
                                if (response.category == 'DONOR') {
                                  Navigator.pushNamed(context, RouteNames.donorHome);
                                }if (response.category == 'RECIPIENT') {
                                  Navigator.pushNamed(context, RouteNames.Rhome);
                                }
                              }
                            },
                            textColor: Colors.white,
                            text: 'Proceed',
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.authScreen);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'New to FreePad? ',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Create an account',
                                style: TextStyle(
                                  color: Theme.of(context).iconTheme.color,
                                )),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
