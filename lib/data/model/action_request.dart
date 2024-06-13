// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ActionRequest {
  final String idUser;
  final String action;
  final String jsonData;
  ActionRequest({
    required this.idUser,
    required this.action,
    required this.jsonData,
  });

  Map<String, dynamic> toJson() {
    return {
      "action": action,
      "idUser": idUser,
      "jsonData": jsonData,
    };
  }

  String toJsonString() {
      return json.encode(toJson());
    }

  @override
  String toString() =>
      'ActionRequest(idUser: $idUser, action: $action, jsonData: $jsonData)';

  @override
  bool operator ==(covariant ActionRequest other) {
    if (identical(this, other)) return true;

    return other.idUser == idUser &&
        other.action == action &&
        other.jsonData == jsonData;
  }

  @override
  int get hashCode => idUser.hashCode ^ action.hashCode ^ jsonData.hashCode;
}
