import 'dart:convert';
import 'package:taoday/data/model/enum/friendship_status.dart';

class Relationship {
  final String id;
  final String avatar;
  final FriendshipStatus friendshipStatus;
  final String fromIdFriendship;
  final String idFriendship;
  final double latitude;
  final double longitude;
  final String name;
  final String qrCode;
  final String session;
  final String status;
  final String toIdFriendship;
  final String updated;
  final bool checkSelect;
  Relationship({
    this.id = "",
    this.avatar = "",
    this.friendshipStatus = FriendshipStatus.REQUEST,
    this.fromIdFriendship = "",
    this.idFriendship = "",
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.name = "",
    this.qrCode = "",
    this.session = "",
    this.status = "",
    this.toIdFriendship = "",
    this.updated = "",
    this.checkSelect = false,
  });

  Relationship copyWith({
    String? id,
    String? avatar,
    FriendshipStatus? friendshipStatus,
    String? fromIdFriendship,
    String? idFriendship,
    double? latitude,
    double? longitude,
    String? name,
    String? qrCode,
    String? session,
    String? status,
    String? toIdFriendship,
    String? updated,
    bool? checkSelect,
  }) {
    return Relationship(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      friendshipStatus: friendshipStatus ?? this.friendshipStatus,
      fromIdFriendship: fromIdFriendship ?? this.fromIdFriendship,
      idFriendship: idFriendship ?? this.idFriendship,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      qrCode: qrCode ?? this.qrCode,
      session: session ?? this.session,
      status: status ?? this.status,
      toIdFriendship: toIdFriendship ?? this.toIdFriendship,
      updated: updated ?? this.updated,
      checkSelect: checkSelect ?? this.checkSelect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'avatar': avatar,
      'friendshipStatus': friendshipStatus.status,
      'fromIdFriendship': fromIdFriendship,
      'idFriendship': idFriendship,
      'latitude': latitude,
      'longitude': longitude,
      'name': name,
      'qrCode': qrCode,
      'session': session,
      'status': status,
      'toIdFriendship': toIdFriendship,
      'updated': updated,
      'checkSelect': checkSelect,
    };
  }

  factory Relationship.fromMap(Map<String, dynamic> map) {
    return Relationship(
      id: map['id'] as String,
      avatar: map['avatar'] as String,
      friendshipStatus: FriendshipStatusExtension.fromString(
          map['friendshipStatus'] as String),
      fromIdFriendship: map['fromIdFriendship'] as String,
      idFriendship: map['idFriendship'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      name: map['name'] as String,
      qrCode: map['qrCode'] as String,
      session: map['session'] as String,
      status: map['status'] as String,
      toIdFriendship: map['toIdFriendship'] as String,
      updated: map['updated'] as String,
      checkSelect: map['checkSelect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relationship.fromJson(String source) =>
      Relationship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Relationship(id: $id, avatar: $avatar, friendshipStatus: $friendshipStatus, fromIdFriendship: $fromIdFriendship, idFriendship: $idFriendship, latitude: $latitude, longitude: $longitude, name: $name, qrCode: $qrCode, session: $session, status: $status, toIdFriendship: $toIdFriendship, updated: $updated, checkSelect: $checkSelect)';
  }

  @override
  bool operator ==(covariant Relationship other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.avatar == avatar &&
        other.friendshipStatus == friendshipStatus &&
        other.fromIdFriendship == fromIdFriendship &&
        other.idFriendship == idFriendship &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.name == name &&
        other.qrCode == qrCode &&
        other.session == session &&
        other.status == status &&
        other.toIdFriendship == toIdFriendship &&
        other.updated == updated &&
        other.checkSelect == checkSelect;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        avatar.hashCode ^
        friendshipStatus.hashCode ^
        fromIdFriendship.hashCode ^
        idFriendship.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        name.hashCode ^
        qrCode.hashCode ^
        session.hashCode ^
        status.hashCode ^
        toIdFriendship.hashCode ^
        updated.hashCode ^
        checkSelect.hashCode;
  }
}
