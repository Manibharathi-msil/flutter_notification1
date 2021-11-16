import 'DataX.dart';

class Data {
    DataX data;
    String message;
    int statusCode;
    bool success;

    Data({this.data, this.message, this.statusCode, this.success});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            data: json['data'] != null ? DataX.fromJson(json['data']) : null,
            message: json['message'], 
            statusCode: json['statusCode'], 
            success: json['success'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['message'] = this.message;
        data['statusCode'] = this.statusCode;
        data['success'] = this.success;
        if (this.data != null) {
            data['data'] = this.data.toJson();
        }
        return data;
    }
}