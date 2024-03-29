


import 'package:cloud_firestore/cloud_firestore.dart';

class LogedinUserDataModel {
  String? firstName;
  String? lastName;
  String? headlin;
  String? profileAbout;
  String? userGmail;
  String? userUid;
  Timestamp? date;

  LogedinUserDataModel(
      {this.firstName,
        this.lastName,
        this.headlin,
        this.profileAbout,
        this.userGmail,
        this.userUid,
        this.date});

  LogedinUserDataModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    headlin = json['headlin'];
    profileAbout = json['profileAbout'];
    userGmail = json['userGmail'];
    userUid = json['userUid'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['headlin'] = this.headlin;
    data['profileAbout'] = this.profileAbout;
    data['userGmail'] = this.userGmail;
    data['userUid'] = this.userUid;
    data['date'] = this.date;
    return data;
  }
}
