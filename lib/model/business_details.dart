import 'dart:convert';

class BusinessDetails {
  String id;
  String alias;
  String name;
  String imageUrl;
  bool isClaimed;
  bool isClosed;
  String url;
  String phone;
  String displayPhone;
  int reviewCount;
  List<Category> categories;
  double rating;
  LocationDetails location;
  Coordinates coordinates;
  List<String> photos;
  String price;
  List<Hour> hours;
  List<String> transactions;

  BusinessDetails(
    this.id,
    this.alias,
    this.name,
    this.imageUrl,
    this.isClaimed,
    this.isClosed,
    this.url,
    this.phone,
    this.displayPhone,
    this.reviewCount,
    this.categories,
    this.rating,
    this.location,
    this.coordinates,
    this.photos,
    this.price,
    this.hours,
    this.transactions,
  );

  factory BusinessDetails.fromRawJson(String str) =>
      BusinessDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessDetails.fromJson(Map<String, dynamic> json) =>
      BusinessDetails(
        json["id"],
        json["alias"],
        json["name"],
        json["image_url"],
        json["is_claimed"],
        json["is_closed"],
        json["url"],
        json["phone"],
        json["display_phone"],
        json["review_count"],
        List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        json["rating"].toDouble(),
        LocationDetails.fromJson(json["location"]),
        Coordinates.fromJson(json["coordinates"]),
        List<String>.from(json["photos"].map((x) => x)),
        json["price"],
        List<Hour>.from(json["hours"].map((x) => Hour.fromJson(x))),
        List<String>.from(json["transactions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "name": name,
        "image_url": imageUrl,
        "is_claimed": isClaimed,
        "is_closed": isClosed,
        "url": url,
        "phone": phone,
        "display_phone": displayPhone,
        "review_count": reviewCount,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "rating": rating,
        "location": location.toJson(),
        "coordinates": coordinates.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "price": price,
        "hours": List<dynamic>.from(hours.map((x) => x.toJson())),
        "transactions": List<dynamic>.from(transactions.map((x) => x)),
      };
}

class Category {
  String alias;
  String title;

  Category(
    this.alias,
    this.title,
  );

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        json["alias"],
        json["title"],
      );

  Map<String, dynamic> toJson() => {
        "alias": alias,
        "title": title,
      };
}

class Coordinates {
  double latitude;
  double longitude;

  Coordinates(
    this.latitude,
    this.longitude,
  );

  factory Coordinates.fromRawJson(String str) =>
      Coordinates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        json["latitude"].toDouble(),
        json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Hour {
  List<Open> open;
  String hoursType;
  bool isOpenNow;

  Hour(
    this.open,
    this.hoursType,
    this.isOpenNow,
  );

  factory Hour.fromRawJson(String str) => Hour.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        List<Open>.from(json["open"].map((x) => Open.fromJson(x))),
        json["hours_type"],
        json["is_open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open": List<dynamic>.from(open.map((x) => x.toJson())),
        "hours_type": hoursType,
        "is_open_now": isOpenNow,
      };
}

class Open {
  bool isOvernight;
  String start;
  String end;
  int day;

  Open(
    this.isOvernight,
    this.start,
    this.end,
    this.day,
  );

  factory Open.fromRawJson(String str) => Open.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Open.fromJson(Map<String, dynamic> json) => Open(
        json["is_overnight"],
        json["start"],
        json["end"],
        json["day"],
      );

  Map<String, dynamic> toJson() => {
        "is_overnight": isOvernight,
        "start": start,
        "end": end,
        "day": day,
      };
}

class LocationDetails {
  String address1;
  String address2;
  String address3;
  String city;
  String zipCode;
  String country;
  String state;
  List<String> displayAddress;
  String crossStreets;

  LocationDetails(
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.displayAddress,
    this.crossStreets,
  );

  factory LocationDetails.fromRawJson(String str) =>
      LocationDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      LocationDetails(
        json["address1"],
        json["address2"],
        json["address3"],
        json["city"],
        json["zip_code"],
        json["country"],
        json["state"],
        List<String>.from(json["display_address"].map((x) => x)),
        json["cross_streets"],
      );

  Map<String, dynamic> toJson() => {
        "address1": address1,
        "address2": address2,
        "address3": address3,
        "city": city,
        "zip_code": zipCode,
        "country": country,
        "state": state,
        "display_address": List<dynamic>.from(displayAddress.map((x) => x)),
        "cross_streets": crossStreets,
      };
}
