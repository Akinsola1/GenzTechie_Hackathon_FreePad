
import 'package:free_pad/core/respositories.dart/auth_repositories.dart';
import 'package:free_pad/core/respositories.dart/user_repositories.dart';
import 'package:free_pad/ui/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class AppProviders {
  //The providers for dependency injection and state management are to added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    //format for registering providers:
    ListenableProvider(create: (_) => ThemeNotifier()),
    ListenableProvider(create: (_) => AuthProvider()),
    ListenableProvider(create: (_) => UserProvider()),


   
  ];
}
