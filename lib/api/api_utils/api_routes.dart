class ApiRoutes {
  //base route
  static const String base = 'https://freepad.herokuapp.com/api/v1';

  //AUthentication
  static const String signUp = '$base/register';
  static const String login = '$base/login';
  static const String userProfile = '$base/profile';  

  // request
  static const String donateRequest = '$base/requests';
  //create request
  static const String createRequest = '$base/requests/create';
  //make donation 
  static const String makeDonation = '$base/requests/create';
  // view donation
  static const String viewDonations = '$base/pastdonations';



}
