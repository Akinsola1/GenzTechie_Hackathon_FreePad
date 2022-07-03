// To parse this JSON data, do
//
//     final requestResponse = requestResponseFromJson(jsonString);

import 'dart:convert';

List<RequestResponse> requestResponseFromJson(String str)=>  List<RequestResponse>.from(json.decode(str)['data'].map((x) => RequestResponse.fromJson(x)));

String requestResponseToJson(RequestResponse data) => json.encode(data.toJson());

class RequestResponse {
    RequestResponse({
        this.id,
        this.name,
        this.title,
        this.quantity,
        this.image,
        this.donated,
        this.completed,
        this.city,
        this.state,
        this.pharmacy,
        this.owner,
    });

    int ?id;
    String ?name;
    String ?title;
    int ?quantity;
    String ?image;
    int ?donated;
    bool ?completed;
    String ?city;
    String ?state;
    String ?pharmacy;
    int ?owner;

    factory RequestResponse.fromJson(Map<String, dynamic> json) => RequestResponse(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        quantity: json["quantity"],
        image: json["image"],
        donated: json["donated"],
        completed: json["completed"],
        city: json["city"],
        state: json["state"],
        pharmacy: json["pharmacy"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "quantity": quantity,
        "image": image,
        "donated": donated,
        "completed": completed,
        "city": city,
        "state": state,
        "pharmacy": pharmacy,
        "owner": owner,
    };
}
