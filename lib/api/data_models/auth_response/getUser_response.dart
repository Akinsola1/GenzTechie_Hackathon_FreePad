// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.status,
        this.message,
        this.data,
    });

    int ? status;
    String? message;
    Data ?data;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.name,
        this.email,
        this.category,
        this.image,
        this.wallet,
        this.peopleHelped,
        this.city,
        this.state,
        this.pharmacy,
        this.requests

    });

    String ?name;
    String ?email;
    String ?category;
    String ?image;
    String ?wallet;
    int ? peopleHelped;
    String? city;
    String ?state;
    String ? pharmacy;
    int ? requests;


    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        category: json["category"],
        image: json["image"],
        wallet: json["wallet"],
        peopleHelped: json["people_helped"],
        city: json["city"],
        state: json["state"],
        pharmacy: json["pharmacy"],
        requests: json["requests"],


    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "category": category,
        "image": image,
        "wallet": wallet,
        "people_helped": peopleHelped,
        "city": city,
        "state": state,
        "pharmacy": pharmacy,
    };
}
