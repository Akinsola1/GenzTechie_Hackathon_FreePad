import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:free_pad/core/respositories.dart/auth_repositories.dart';
import 'package:free_pad/ui/responsive_screen/responsive.dart';
import 'package:free_pad/ui/responsive_state/responsive_state.dart';
import 'package:free_pad/widget/custom_button.dart';
import 'package:free_pad/widget/custom_dropDown.dart';
import 'package:free_pad/widget/custom_textfield.dart';

import 'package:provider/provider.dart';



class DonorSignUp extends StatefulWidget {
  const DonorSignUp({Key? key}) : super(key: key);

  @override
  State<DonorSignUp> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<DonorSignUp> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController pharmacyController = TextEditingController();

  String state = '';
  String city = '';
  List<String> cities = [];

  var locations = {
    'Edo State': ["Benin City", "Egor", "Auchi", "Ekpoma"],
    'Lagos Stste' : ["Lagos", "Ikeja", "Ikorodu", "Epe", "Badagry", "Lekki", "Yaba", "Surulere", "Mushin"],
    'Ondo State' : ["Akure", "Owo", "Ifon", "Ore", "Ondo Town", "Ilara-Mokin"],
    'Ogun State' : ["Abeokuta", "Ijebu-Ode", "Ota"],
    'Osun State' : ["Osogbo", "Ife"],
    'Ekiti State' : ["Ado-Ekiti", "Ikere-Ekiti"],
    'Kogi State' : ["Lokoja"],
    'Rivers State' : ["Port-Harcourt"],
    'Anambra' : ["Awka", "Onitsha", "Oba"],
    'Oyo State' : ["Ibadan"],
    'FCT' : ["Abuja"]
  };

  bool hide = true;
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Center(
          child: ListView(
            children: [
              Center(
                  child: Text('Create An Account',
                      style: Theme.of(context).textTheme.headline6)),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: Text("Just 1 pad can improve someone's life",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor))),
              const SizedBox(
                height: 20,
              ),
              responsive.isMobile(context)
                  ? Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: CustomTextField(
                            hintText: '',
                            labelText: 'First Name',
                            controller: firstNameController,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: CustomTextField(
                            hintText: '',
                            labelText: 'Last Name',
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 60,
                          width: size.width / 5,
                          child: CustomTextField(
                              hintText: '',
                              labelText: 'First Name',
                              controller: firstNameController),
                        ),
                        SizedBox(
                          width: size.width / 5,
                          height: 60,
                          child: CustomTextField(
                            hintText: '',
                            labelText: 'Last Name',
                            controller: lastNameController,
                          ),
                        ),
                      ],
                    ),
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
                  hintText: '090123456789',
                  labelText: 'Phone Number',
                  controller: phoneController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              responsive.isMobile(context)
                  ? Column(
                      children: [
                        CustomDropDown(
                          options: locations.keys.toList(),
                          onChanged: (option){
                                    setState(() {
                                      state = option;
                                      cities = locations[state] ?? [];
                                    });
                                  },
                          width: double.infinity,
                          height: 56,
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.5),
                          ),
                          hintText: 'State',
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Theme.of(context).iconTheme.color,
                            size: 30,
                          ),
                          fillColor: Colors.transparent,
                          elevation: 2,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                          initialOption: state,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomDropDown(
                          options: cities.toList(),
                          onChanged: (val) => setState(() => city = val),
                          width: double.infinity,
                          height: 56,
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.5),
                          ),
                          hintText: 'City',
                          icon: Icon(
                            Icons.arrow_drop_down_rounded,
                            color: Theme.of(context).iconTheme.color,
                            size: 30,
                          ),
                          fillColor: Colors.transparent,
                          elevation: 2,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                          initialOption: city,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width / 5,
                          child: CustomDropDown(
                            options: locations.keys.toList(),
                             onChanged: (option){
                                    setState(() {
                                      state = option;
                                      cities = locations[state] ?? [];
                                    });
                                  },
                            width: double.infinity,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.5),
                            ),
                            hintText: 'State',
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Theme.of(context).iconTheme.color,
                              size: 30,
                            ),
                            fillColor: Colors.transparent,
                            elevation: 2,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                            initialOption: state,
                          ),
                        ),
                        SizedBox(
                          width: size.width / 5,
                          child: CustomDropDown(
                            options: cities.toList(),
                            onChanged: (val) => setState(() => city = val),
                            width: double.infinity,
                            height: 56,
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.5),
                            ),
                            hintText: 'City',
                            icon: Icon(
                              Icons.arrow_drop_down_rounded,
                              color: Theme.of(context).iconTheme.color,
                              size: 30,
                            ),
                            fillColor: Colors.transparent,
                            elevation: 2,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                            initialOption: city,
                          ),
                        )
                      ],
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
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ResponsiveState(
                state: authProv.state,
                busyWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(strokeWidth: 6)),
                  ],
                ),
                idleWidget: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () async {
                            bool u = await authProv.signUp(
                                firstNameController.text,
                                lastNameController.text,
                                emailController.text,
                                passwordController.text,
                                'DONOR',
                                phoneController.text,
                                city,
                                state,
                                '');
                            if (u) {
                              Navigator.pushNamed(
                                  context, RouteNames.donorHome);
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
              ),
              const SizedBox(
                height: 20,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.login);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have account? ',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                  )),
                            ],
                          ),
                        )),
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
