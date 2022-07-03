




import 'package:free_pad/api/User_Api/user_api.dart';
import 'package:free_pad/api/User_Api/user_implementation.dart';
import 'package:free_pad/api/api_utils/api_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:free_pad/api/Authentication_api/authentication_api.dart';
import 'package:free_pad/api/Authentication_api/authentication_implementation.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  // services
  locator.registerLazySingleton<API>(() => API());
  // locator.registerLazySingleton<MapService>(() => MapService());

  // API
  locator.registerLazySingleton<AuthenticationApi>(() => AuthenticationApiImpl());
  locator.registerLazySingleton<UserApi>(() => UserImplementation());

 

  

  // Infrastructure
  // locator.registerLazySingleton<UserInfoCache>(() => UserInfoCache());
}
