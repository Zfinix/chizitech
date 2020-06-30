import 'dart:convert';

import 'package:flutter/services.dart';

class DataModel {
  List<DesktopModel> desktop;

  DataModel({this.desktop});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['desktop'] != null) {
      desktop = new List<DesktopModel>();
      json['desktop'].forEach((v) {
        desktop.add(new DesktopModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.desktop != null) {
      data['desktop'] = this.desktop.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static Future<DataModel> initialize() async {
    final data = await rootBundle.loadString('db/db.json');
    return DataModel.fromJson(json.decode(data));
  }
}

class DesktopModel {
  String title;
  String desc;
  String github;
  String img;

  DesktopModel({this.title, this.desc, this.github, this.img});

  DesktopModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    github = json['github'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['github'] = this.github;
    data['img'] = this.img;
    return data;
  }
}
