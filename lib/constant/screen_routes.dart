import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_pad/ui/screens/authentication/auth_screen.dart';
import 'package:free_pad/ui/screens/authentication/donor/donor_login.dart';
import 'package:free_pad/ui/screens/authentication/donor/donor_signUp.dart';
import 'package:free_pad/ui/screens/authentication/landing_screen.dart';
import 'package:free_pad/ui/screens/authentication/receipient/recipient_signUp.dart';
import 'package:free_pad/ui/screens/home/Donor_home/donate_screen.dart';
import 'package:free_pad/ui/screens/home/Donor_home/donor_home_screen.dart';
import 'package:free_pad/ui/screens/home/Donor_home/view_previous_donations.dart';
import 'package:free_pad/ui/screens/home/Recipient_home/recipient_home_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String landingScreen = 'landingScreen';
  static const String authScreen = 'authScreen';

  static const String loginScreen = 'loginScreen';
  static const String signUpScreen = 'signUpScreen';
  static const String homeScreen = 'homeScreen';
  static const String login = 'login';
  static const String donorSignUp = 'donorSignUp';
  static const String RsignUp = 'RsignUp';
  static const String donorHome = 'donorHome';
  static const String Rhome = 'Rhome';
  static const String donateScreen = 'donateScreen';
  static const String viewPreviousDOnation = 'viewPreviousDOnation';



  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    landingScreen: (context) => LandingScreen(),
    authScreen: (context) => AuthScreen(),
    login: (context) => LoginScreen(),
    donorSignUp: (context) => DonorSignUp(),
    RsignUp: (context) => RecipientSignUp(),
    donorHome: (context) => DonorHome(),
    Rhome: (context) => RecipientHome(),
    donateScreen: (context) => DonateScreen(),
    viewPreviousDOnation: (context) => ViewPreviousDOnation(),



  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case landingScreen:
        return MaterialPageRoute(
            builder: (context) =>
                LandingScreen()); //Default Route is error route

      case authScreen:
        return MaterialPageRoute(builder: (context) => AuthScreen());
      case login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case donorSignUp:
        return MaterialPageRoute(builder: (context) => DonorSignUp());

      case RsignUp:
        return MaterialPageRoute(builder: (context) => RecipientSignUp());
      case donorHome:
        return MaterialPageRoute(builder: (context) => DonorHome());
      case Rhome: 
        return MaterialPageRoute(builder: (context) => RecipientHome());
      case donateScreen:
        return MaterialPageRoute(builder: (context) => DonateScreen());
       case viewPreviousDOnation:
        return MaterialPageRoute(builder: (context) => ViewPreviousDOnation());


      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name));
    }
  }

  static Widget errorView(name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
