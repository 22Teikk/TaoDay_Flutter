import 'package:dio/dio.dart';
import 'package:taoday/core/utils/constant.dart';
import 'package:taoday/data/model/action_request.dart';
import 'package:taoday/data/model/app_action.dart';
import 'package:taoday/data/model/user.dart';

class ApiService {
  Dio dio = Dio();
  ApiService() {
    dio = Dio(BaseOptions(baseUrl: SERVER_URL));
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
