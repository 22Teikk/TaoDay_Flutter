import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/data/model/action_request.dart';
import 'package:taoday/data/model/enum/app_action.dart';
import 'package:taoday/data/model/ralationship.dart';
import 'package:taoday/data/model/user.dart';

class ApiService {
  Dio dio = Dio();
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: SERVER_URL));
  }
  static const String urlAction = "${SERVER_URL}action";

  Future<Relationship?> getRalationSipByID(String uid) async {
    try {
      final actionRequest = ActionRequest(
          action: AppAction.GET_FRIENDSHIP_USER.action,
          idUser: "",
          jsonData: jsonDecode(uid));
      final response =
          await Dio().post(urlAction, data: actionRequest.toJsonString());
      if (response.statusCode == 200) {
        return Relationship.fromMap(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future createRelationship(Relationship relationship) async {
    var pref = await SharedPreferences.getInstance();
    String uid = pref.getString(UID) ?? "";
    try {
      final actionRequest = ActionRequest(
          action: AppAction.CREATE_RELATIONSHIP.action,
          idUser: uid,
          jsonData: relationship.toJson());
      final response = await Dio().post(
        urlAction,
        data: actionRequest.toJsonString(),
      );
      if (response.statusCode == 200) {
        return relationship;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> postUser(User user) async {
    try {
      final actionRequest = ActionRequest(
        idUser: user.idUser,
        action: AppAction.GET_USER.action,
        jsonData: user.toJson(),
      );
      final response = await Dio().post(
        "${SERVER_URL}action",
        data: actionRequest.toJsonString(),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData != null) {
          return User.fromMap(responseData);
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load user: $e');
    }
  }
}
