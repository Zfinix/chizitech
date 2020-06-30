import 'dart:convert';

import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class DB {
  static Future<DataModel> get(context) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };

      var response = await http.get(APIUrl.db, headers: headers);
      print(response.body);
      if (response.body != null && response.statusCode == 200) {
        return DataModel.fromJson(json.decode(response.body));
      } else {
        showCupertinoDialog(
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('Error!'),
                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Oops an Error Occurred'),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    child: Text('Close'),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
            context: context);
      }

      return null;
    } catch (e) {
      showCupertinoDialog(
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Oops'),
              content: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('An Error Occurred'),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text('Seen'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
          context: context);

      print(e.toString());
    }
    return null;
  }
}
