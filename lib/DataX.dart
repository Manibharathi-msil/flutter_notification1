import 'dart:html';

import 'package:flutter_notification1/Notification.dart';

class DataX {
  List<Notification> notifications;

  DataX({this.notifications});

  factory DataX.fromJson(Map<String, dynamic> json) {
    return DataX(
      notifications: json['notifications'] != null
          ? (json['notifications'] as List)
              .map((i) => Notification.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
