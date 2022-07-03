// To parse this JSON data, do
//
//     final makeRequestResponse = makeRequestResponseFromJson(jsonString);

import 'dart:convert';

MakeRequestResponse makeRequestResponseFromJson(String str) => MakeRequestResponse.fromJson(json.decode(str));

String makeRequestResponseToJson(MakeRequestResponse data) => json.encode(data.toJson());

class MakeRequestResponse {
    MakeRequestResponse({
        this.status,
        this.message,
    });

    int ?status;
    String? message;

    factory MakeRequestResponse.fromJson(Map<String, dynamic> json) => MakeRequestResponse(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
