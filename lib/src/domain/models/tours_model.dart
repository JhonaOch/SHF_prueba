import 'dart:convert';

List<Tours> toursFromJson(String str) =>
    List<Tours>.from(json.decode(str).map((x) => Tours.fromJson(x)));
String toursToJson(List<Tours> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tours {
  String id;
  String name;
  String description;
  int price;
  List<DateTime> availableDates;
  int minDuration;
  int maxDuration;
  DurationUnit durationUnit;
  DateTime startDate;
  DateTime endDate;
  String address;
  double lat;
  double lng;
  String included;
  String excluded;
  DateTime createdAt;
  DateTime updatedAt;
  TourOperatorId tourOperatorId;
  String categoryId;
  String pictureUrl;
  List<Image> images;
  List<Interest> interests;
  Operator tourOperator;

  Tours({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.availableDates,
    required this.minDuration,
    required this.maxDuration,
    required this.durationUnit,
    required this.startDate,
    required this.endDate,
    required this.address,
    required this.lat,
    required this.lng,
    required this.included,
    required this.excluded,
    required this.createdAt,
    required this.updatedAt,
    required this.tourOperatorId,
    required this.categoryId,
    required this.pictureUrl,
    required this.images,
    required this.interests,
    required this.tourOperator,
  });

  factory Tours.fromJson(Map<String, dynamic> json) => Tours(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        availableDates: List<DateTime>.from(
            json["availableDates"].map((x) => DateTime.parse(x))),
        minDuration: json["minDuration"],
        maxDuration: json["maxDuration"],
        durationUnit: durationUnitValues.map[json["durationUnit"]]!,
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        included: json["included"],
        excluded: json["excluded"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tourOperatorId: tourOperatorIdValues.map[json["tourOperatorId"]]!,
        categoryId: json["categoryId"],
        pictureUrl: json["pictureUrl"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        interests: List<Interest>.from(
            json["interests"].map((x) => Interest.fromJson(x))),
        tourOperator: Operator.fromJson(json["operator"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "availableDates": List<dynamic>.from(availableDates.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "durationUnit": durationUnitValues.reverse[durationUnit],
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "address": address,
        "lat": lat,
        "lng": lng,
        "included": included,
        "excluded": excluded,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "tourOperatorId": tourOperatorIdValues.reverse[tourOperatorId],
        "categoryId": categoryId,
        "pictureUrl": pictureUrl,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "interests": List<dynamic>.from(interests.map((x) => x.toJson())),
        "operator": tourOperator.toJson(),
      };
}

enum DurationUnit {
  // ignore: constant_identifier_names
  MINUTES,
  // ignore: constant_identifier_names
  HOURS,
  // ignore: constant_identifier_names
  DAYS,
  // ignore: constant_identifier_names
  DURATION_UNIT_DAYS,
  // ignore: constant_identifier_names
  DURATION_UNIT_HOURS,
  // ignore: constant_identifier_names
  PURPLE_HOURS
}

final durationUnitValues = EnumValues({
  "days": DurationUnit.DAYS,
  "days\u000d\n": DurationUnit.DURATION_UNIT_DAYS,
  "hours\u000d\n": DurationUnit.DURATION_UNIT_HOURS,
  "hours": DurationUnit.HOURS,
  "minutes": DurationUnit.MINUTES,
  "Hours": DurationUnit.PURPLE_HOURS
});

class Image {
  String id;
  String pictureUrl;
  String tourId;
  DateTime createdAt;
  DateTime updatedAt;

  Image({
    required this.id,
    required this.pictureUrl,
    required this.tourId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        pictureUrl: json["pictureUrl"],
        tourId: json["tourId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pictureUrl": pictureUrl,
        "tourId": tourId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Interest {
  String tourId;
  String interestId;
  DateTime createdAt;
  DateTime updatedAt;

  Interest({
    required this.tourId,
    required this.interestId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        tourId: json["tourId"],
        interestId: json["interestId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "tourId": tourId,
        "interestId": interestId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Operator {
  TourOperatorId id;
  Name name;
  String pictureUrl;
  String phone;
  Email email;
  Address address;

  Operator({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
        id: tourOperatorIdValues.map[json["id"]]!,
        name: nameValues.map[json["name"]]!,
        pictureUrl: json["pictureUrl"],
        phone: json["phone"],
        email: emailValues.map[json["email"]]!,
        address: addressValues.map[json["address"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": tourOperatorIdValues.reverse[id],
        "name": nameValues.reverse[name],
        "pictureUrl": pictureUrl,
        "phone": phone,
        "email": emailValues.reverse[email],
        "address": addressValues.reverse[address],
      };
}

enum Address {
  // ignore: constant_identifier_names
  THE_411_FEENEY_STATION,
  // ignore: constant_identifier_names
  THE_5147_LIANA_RUE,
  // ignore: constant_identifier_names
  THE_5996_WEHNER_STREAM,
  // ignore: constant_identifier_names
  THE_54680_ELBERT_PLAZA,
  // ignore: constant_identifier_names
  THE_695_MARILIE_ROADS
}

final addressValues = EnumValues({
  "411 Feeney Station": Address.THE_411_FEENEY_STATION,
  "5147 Liana Rue": Address.THE_5147_LIANA_RUE,
  "54680 Elbert Plaza": Address.THE_54680_ELBERT_PLAZA,
  "5996 Wehner Stream": Address.THE_5996_WEHNER_STREAM,
  "695 Marilie Roads": Address.THE_695_MARILIE_ROADS
});

enum Email {
  // ignore: constant_identifier_names
  INFO_SHF_COM_CO,
  // ignore: constant_identifier_names
  ULISES_WOLF62_GMAIL_COM,
  // ignore: constant_identifier_names
  DELL_UPTON_GMAIL_COM,
  // ignore: constant_identifier_names
  ELISHA_JERDE_YAHOO_COM,
  // ignore: constant_identifier_names
  WANDA_MANN58_HOTMAIL_COM
}

final emailValues = EnumValues({
  "Dell_Upton@gmail.com": Email.DELL_UPTON_GMAIL_COM,
  "Elisha.Jerde@yahoo.com": Email.ELISHA_JERDE_YAHOO_COM,
  "info@shf.com.co": Email.INFO_SHF_COM_CO,
  "Ulises.Wolf62@gmail.com": Email.ULISES_WOLF62_GMAIL_COM,
  "Wanda_Mann58@hotmail.com": Email.WANDA_MANN58_HOTMAIL_COM
});

enum TourOperatorId {
  // ignore: constant_identifier_names
  CL0_U7_NUBW004481_QLA8_EEL5_NU,
  // ignore: constant_identifier_names
  CL0_U7_NVZ8037681_QLFHU7_WQOA,
  // ignore: constant_identifier_names
  CL0_U7_NZ1_F149881_QLTK62_R677,
  // ignore: constant_identifier_names
  CL0_U7_NUMK011481_QLDUZ0_W4_F8,
  // ignore: constant_identifier_names
  CL0_U7_NUWZ017881_QLXPIBXB8_J
}

final tourOperatorIdValues = EnumValues({
  "cl0u7nubw004481qla8eel5nu": TourOperatorId.CL0_U7_NUBW004481_QLA8_EEL5_NU,
  "cl0u7numk011481qlduz0w4f8": TourOperatorId.CL0_U7_NUMK011481_QLDUZ0_W4_F8,
  "cl0u7nuwz017881qlxpibxb8j": TourOperatorId.CL0_U7_NUWZ017881_QLXPIBXB8_J,
  "cl0u7nvz8037681qlfhu7wqoa": TourOperatorId.CL0_U7_NVZ8037681_QLFHU7_WQOA,
  "cl0u7nz1f149881qltk62r677": TourOperatorId.CL0_U7_NZ1_F149881_QLTK62_R677
});

enum Name {
  // ignore: constant_identifier_names
  IGNACIO_GOTTLIEB,
  // ignore: constant_identifier_names
  MARVIN_KIRLIN,
  // ignore: constant_identifier_names
  OPAL_LESCH,
  // ignore: constant_identifier_names
  CASSANDRA_FADEL,
  // ignore: constant_identifier_names
  JOY_BERGE
}

final nameValues = EnumValues({
  "Cassandra Fadel": Name.CASSANDRA_FADEL,
  "Ignacio Gottlieb": Name.IGNACIO_GOTTLIEB,
  "Joy Berge": Name.JOY_BERGE,
  "Marvin Kirlin": Name.MARVIN_KIRLIN,
  "Opal Lesch": Name.OPAL_LESCH
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
