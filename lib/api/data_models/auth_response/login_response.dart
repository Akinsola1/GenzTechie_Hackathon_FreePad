// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.status,
        this.message,
        this.category,
        this.data,
    });

    int ?status;
    String? message;
    String ?category;
    Data ?data;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        category: json["category"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "category": category,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.token,
    });

    String ? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
