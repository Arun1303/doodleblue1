// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Business> businesses;
  int total;
  Region region;

  Welcome(
    this.businesses,
    this.total,
    this.region,
  );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        List<Business>.from(
            json["businesses"].map((x) => Business.fromJson(x))),
        json["total"],
        Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "businesses": List<dynamic>.from(businesses.map((x) => x.toJson())),
        "total": total,
        "region": region.toJson(),
      };
}

class Business {
  String? id;
  String? alias;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  // List<Category>? categories;
  double? rating;
  Center? coordinates;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;
  double? distance;

  Business(
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClosed,
    this.url,
    this.reviewCount,
    // this.categories,
    this.rating,
    this.coordinates,
    this.transactions,
    this.price,
    this.location,
    this.phone,
    this.displayPhone,
    this.distance,
  );

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        json["id"],
        json["alias"],
        json["name"],
        json["image_url"],
        json["is_closed"],
        json["url"],
        json["review_count"],
        //  List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        json["rating"].toDouble(),
        Center.fromJson(json["coordinates"]),
        List<String>.from(json["transactions"]),
        json["price"] ?? '',
        Location.fromJson(json["location"]),
        json["phone"],
        json["display_phone"],
        json["distance"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "name": name,
        "image_url": imageUrl,
        "is_closed": isClosed,
        "url": url,
        "review_count": reviewCount,
        // "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "rating": rating,
        "coordinates": coordinates,
        "transactions": transactions,
        "price": price,
        "location": location?.toJson(),
        "phone": phone,
        "display_phone": displayPhone,
        "distance": distance,
      };
}

class Category {
  String? alias;
  String? title;

  Category(
    this.alias,
    this.title,
  );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        json["alias"],
        json["title"],
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
        "title": title,
      };
}

class Center {
  double? latitude;
  double? longitude;

  Center(
    this.latitude,
    this.longitude,
  );

  factory Center.fromJson(Map<String, dynamic> json) => Center(
        json["latitude"].toDouble(),
        json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Location {
  String? address1;
  String? address2;
  String? address3;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location(
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
  );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        json["address1"],
        json["address2"],
        json["address3"],
        json["city"],
        json["zip_code"],
        json["country"],
        json["state"],
        List<String>.from(json["display_address"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "city": city,
        "zip_code": zipCode,
        "country": country,
        "state": state,
        "display_address": displayAddress,
      };
}

class Region {
  Center center;
  Region(
    this.center,
  );

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        Center.fromJson(json["center"]),
      );

  Map<String, dynamic> toJson() => {
        "center": center.toJson(),
      };
}
