// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromMap(jsonString);

import 'dart:convert';

class ApiResponse {
  ApiResponse({
    this.responseCode,
     this.shortDescription,
     this.data,
  });


  int ? responseCode;
  String ? shortDescription;
  covariant dynamic data;

  factory ApiResponse.fromJson(String str) => ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
    responseCode: json["status"],
    shortDescription: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "responseCode": responseCode,
    "shortDescription": shortDescription,
    "data": data,
  };
}
