
import 'package:free_pad/api/api_utils/network_exception.dart';
import 'package:free_pad/api/data_models/api_response.dart';

dynamic responseHandler(response, {bool hideLog = false}) async {
  //Attempt to derive error message
  String exceptionMsg;
  String exceptionCode;
  ApiResponse _responsebody;
  try {
    _responsebody = ApiResponse.fromJson(response.body);
    exceptionMsg = _responsebody.responseCode!.toString();
  } catch (e) {
    print("Error deriving error message: $e");
    exceptionMsg = response.body;
    // exceptionCode = response.statusCode.toString();
  }

  if (!hideLog) {
    print(response.body);
    print("status code: ${response}");
  }

  switch (response.statusCode) {
    case 201:
      return response.body;
      break;
    case 200:
      return response.body;
      break;
    case 400:
      throw BadRequestException(exceptionMsg);
    case 401:
    case 403:
      throw UnauthorisedException(exceptionMsg);
    case 404:
      throw FileNotFoundException('$exceptionMsg');
    case 422:
    //extract errors
      try {
    _responsebody = ApiResponse.fromJson(response.body);
        exceptionMsg = _responsebody.responseCode!.toString();
      } catch (e) {
        print("could not extract errors");
      }

      throw AlreadyRegisteredException('$exceptionMsg');
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
