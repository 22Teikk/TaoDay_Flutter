enum FriendshipStatus {
  REQUEST,
  FRIEND,
  DEFAULT,
  BLOCK,
  HISTORY,
}

extension FriendshipStatusExtension on FriendshipStatus {
  String get status {
    switch (this) {
      case FriendshipStatus.REQUEST:
        return 'REQUEST';
      case FriendshipStatus.FRIEND:
        return 'FRIEND';
      case FriendshipStatus.DEFAULT:
        return 'DEFAULT';
      case FriendshipStatus.BLOCK:
        return 'BLOCK';
      case FriendshipStatus.HISTORY:
        return 'HISTORY';
    }
  }

  static FriendshipStatus fromString(String status) {
    switch (status) {
      case 'REQUEST':
        return FriendshipStatus.REQUEST;
      case 'FRIEND':
        return FriendshipStatus.FRIEND;
      case 'DEFAULT':
        return FriendshipStatus.DEFAULT;
      case 'BLOCK':
        return FriendshipStatus.BLOCK;
      case 'HISTORY':
        return FriendshipStatus.HISTORY;
      default:
        throw Exception('Unknown status: $status');
    }
  }
}
