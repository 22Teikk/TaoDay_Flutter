enum AppAction {
  GET_FRIENDS,
  DELETE_USER,
  DELETE_FRIEND,
  UPDATE_FRIEND,
  UPDATE_LOCATION,
  UPDATE_USER,
  GET_USER,
  GET_FRIENDSHIP_USER,
  CREATE_RELATIONSHIP,
  GET_RELATIONSHIPS,
  GET_RELATIONSHIP,
  UPDATE_RELATIONSHIP,
  USER_SOS,
}

extension AppActionExtension on AppAction {
  String get action {
    switch (this) {
      case AppAction.GET_FRIENDS:
        return "GET_FRIENDS";
      case AppAction.DELETE_USER:
        return "DELETE_USER";
      case AppAction.DELETE_FRIEND:
        return "DELETE_FRIEND";
      case AppAction.UPDATE_FRIEND:
        return "UPDATE_FRIEND";
      case AppAction.UPDATE_LOCATION:
        return "UPDATE_LOCATION";
      case AppAction.UPDATE_USER:
        return "UPDATE_USER";
      case AppAction.GET_USER:
        return "GET_USER";
      case AppAction.GET_FRIENDSHIP_USER:
        return "GET_FRIENDSHIP_USER";
      case AppAction.CREATE_RELATIONSHIP:
        return "CREATE_RELATIONSHIP";
      case AppAction.GET_RELATIONSHIPS:
        return "GET_RELATIONSHIPS";
      case AppAction.GET_RELATIONSHIP:
        return "GET_RELATIONSHIP";
      case AppAction.UPDATE_RELATIONSHIP:
        return "UPDATE_RELATIONSHIP";
      case AppAction.USER_SOS:
        return "USER_SOS";
      default:
        throw Exception("Unknown action");
    }
  }
}