import 'dart:convert';
import 'package:flutter/services.dart';

class DataModel {
  List<DesktopModel> desktop = [];
  DataModel({
    required this.desktop,
  });

  static Future<DataModel> initialize() async {
    final data = await rootBundle.loadString('db/db.json');
    return DataModel.fromJson(json.decode(data));
  }

  DataModel copyWith({
    List<DesktopModel>? desktop,
  }) {
    return DataModel(
      desktop: desktop ?? this.desktop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'desktop': desktop.map((x) => x.toMap()).toList(),
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      desktop: List<DesktopModel>.from(
          map['desktop']?.map((x) => DesktopModel.fromJson(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));

  @override
  String toString() => 'DataModel(desktop: $desktop)';
}

class DesktopModel {
  final String title;
  final String desc;
  final String? github;
  final String img;

  DesktopModel({
    required this.title,
    required this.desc,
    required this.github,
    required this.img,
  });

  DesktopModel copyWith({
    String? title,
    String? desc,
    String? github,
    String? img,
  }) {
    return DesktopModel(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      github: github ?? this.github,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'github': github,
      'img': img,
    };
  }

  factory DesktopModel.fromMap(Map<String, dynamic> map) {
    return DesktopModel(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      github: map['github'] ?? '',
      img: map['img'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DesktopModel.fromJson(String source) =>
      DesktopModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DesktopModel(title: $title, desc: $desc, github: $github, img: $img)';
  }
}
