import 'NavigationInfo.dart';

class Notification {
  List<String> descriptions;
  String header;
  String image;
  NavigationInfo navigation_info;
  String time_sent;

  Notification(
      {this.descriptions,
      this.header,
      this.image,
      this.navigation_info,
      this.time_sent});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      descriptions: json['descriptions'] != null
          ? new List<String>.from(json['descriptions'])
          : null,
      header: json['header'],
      image: json['image'],
      navigation_info: json['navigation_info'] != null
          ? NavigationInfo.fromJson(json['navigation_info'])
          : null,
      time_sent: json['time_sent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['image'] = this.image;
    data['time_sent'] = this.time_sent;
    if (this.descriptions != null) {
      data['descriptions'] = this.descriptions;
    }
    if (this.navigation_info != null) {
      data['navigation_info'] = this.navigation_info.toJson();
    }
    return data;
  }
}
