class Portfolio {
  //String memberId;
  String company;
  String description;
  String location;
  String position;
  Portfolio(this.company, this.description, this.location, this.position);
  Portfolio.fromJson(Map<String, dynamic> json) {
    // memberId = json['member_id'];
    // phone = json['phone'];
    company = json['company'];
    description = json['description'];
    location = json['location'];
    position = json['position'];
  }
}
