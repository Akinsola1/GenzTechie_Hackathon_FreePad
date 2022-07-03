class ApiRoutes {
  //base route
  static const String base = 'http://api.freepad.xyz/api/v1';

  //AUthentication
  static const String signUp = '$base/register';
  static const String login = '$base/login';
  static const String userProfile = '$base/profile';

  // request
  static const String donateRequest = '$base/requests';
  //create request
  static const String createRequest = '$base/requests/create';


}
