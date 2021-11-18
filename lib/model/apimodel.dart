// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  Data data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.notifications,
  });

  List<Notificationapi> notifications;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<Notificationapi>.from(
            json["notifications"].map((x) => Notificationapi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
      };
}

class Notificationapi {
  Notificationapi({
    this.image,
    this.header,
    this.descriptions,
    this.timeSent,
    this.navigationInfo,
  });

  String image;
  String header;
  List<String> descriptions;
  String timeSent;
  NavigationInfo navigationInfo;

  factory Notificationapi.fromJson(Map<String, dynamic> json) =>
      Notificationapi(
        image: json["image"],
        header: json["header"],
        descriptions: List<String>.from(json["descriptions"].map((x) => x)),
        timeSent: json["time_sent"],
        navigationInfo: NavigationInfo.fromJson(json["navigation_info"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "header": header,
        "descriptions": List<dynamic>.from(descriptions.map((x) => x)),
        "time_sent": timeSent,
        "navigation_info": navigationInfo.toJson(),
      };
}

class NavigationInfo {
  NavigationInfo();

  factory NavigationInfo.fromJson(Map<String, dynamic> json) =>
      NavigationInfo();

  Map<String, dynamic> toJson() => {};
}
