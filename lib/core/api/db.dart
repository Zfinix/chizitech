import 'dart:convert';

import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class DB {
  static final dio = Dio(
    BaseOptions(
      responseType: ResponseType.plain,
    ),
  );

  static Future<DataModel?> get(context) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };

      var response =
          await dio.get(APIUrl.db, options: Options(headers: headers));
      print(response.data);
      if (response.data != null && response.statusCode == 200) {
        return DataModel.fromJson(json.decode(response.data));
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
