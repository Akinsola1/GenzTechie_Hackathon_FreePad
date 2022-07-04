// To parse this JSON data, do
//
//     final makeDonation = makeDonationFromJson(jsonString);

import 'dart:convert';

MakeDonation makeDonationFromJson(String str) => MakeDonation.fromJson(json.decode(str));

String makeDonationToJson(MakeDonation data) => json.encode(data.toJson());

class MakeDonation {
    MakeDonation({
        this.status,
        this.message,
        this.thanks,
    });

    int ?status;
    String ?message;
    String ?thanks;

    factory MakeDonation.fromJson(Map<String, dynamic> json) => MakeDonation(
        status: json["status"],
        message: json["message"],
        thanks: json["thanks"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "thanks": thanks,
    };
}
