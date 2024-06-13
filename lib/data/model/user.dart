import 'dart:convert';

class User {
  final String idUser;
  final String idGoogle;
  final String name;
  final String email;
  final String avatar;
  final String status;
  final String qrCode;
  final String uniqueID;
  final String session;
  final double latitude;
  final double longitude;
  final double rotation;
  final String friendshipStatus;
  final String idFriendship;
  final String idAvatar;

  User({
    this.idUser = "",
    this.idGoogle = "",
    this.name = "",
    this.email = "",
    this.avatar = "",
    this.status = "",
    this.qrCode = "",
    this.uniqueID = "",
    this.session = "",
    this.latitude = 0,
    this.longitude = 0,
    this.rotation = 0,
    this.friendshipStatus = "",
    this.idFriendship = "",
    this.idAvatar = "",
  });

  User copyWith({
    String? idUser,
    String? idGoogle,
    String? name,
    String? email,
    String? avatar,
    String? status,
    String? qrCode,
    String? uniqueID,
    String? session,
    double? latitude,
    double? longitude,
    double? rotation,
    String? friendshipStatus,
    String? idFriendship,
    String? idAvatar,
  }) {
    return User(
      idUser: idUser ?? this.idUser,
      idGoogle: idGoogle ?? this.idGoogle,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      qrCode: qrCode ?? this.qrCode,
      uniqueID: uniqueID ?? this.uniqueID,
      session: session ?? this.session,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rotation: rotation ?? this.rotation,
      friendshipStatus: friendshipStatus ?? this.friendshipStatus,
      idFriendship: idFriendship ?? this.idFriendship,
      idAvatar: idAvatar ?? this.idAvatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'idGoogle': idGoogle,
      'name': name,
      'email': email,
      'avatar': avatar,
      'status': status,
      'qrCode': qrCode,
      'uniqueID': uniqueID,
      'session': session,
      'latitude': latitude,
      'longitude': longitude,
      'rotation': rotation,
      'friendshipStatus': friendshipStatus,
      'idFriendship': idFriendship,
      'idAvatar': idAvatar,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idUser: map['idUser'] as String,
      idGoogle: map['idGoogle'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
      status: map['status'] as String,
      qrCode: map['qrCode'] as String,
      uniqueID: map['uniqueID'] as String,
      session: map['session'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      rotation: map['rotation'] as double,
      friendshipStatus: map['friendshipStatus'] as String,
      idFriendship: map['idFriendship'] as String,
      idAvatar: map['idAvatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(idUser: $idUser, idGoogle: $idGoogle, name: $name, email: $email, avatar: $avatar, status: $status, qrCode: $qrCode, uniqueID: $uniqueID, session: $session, latitude: $latitude, longitude: $longitude, rotation: $rotation, friendshipStatus: $friendshipStatus, idFriendship: $idFriendship, idAvatar: $idAvatar)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.idUser == idUser &&
      other.idGoogle == idGoogle &&
      other.name == name &&
      other.email == email &&
      other.avatar == avatar &&
      other.status == status &&
      other.qrCode == qrCode &&
      other.uniqueID == uniqueID &&
      other.session == session &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.rotation == rotation &&
      other.friendshipStatus == friendshipStatus &&
      other.idFriendship == idFriendship &&
      other.idAvatar == idAvatar;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
      idGoogle.hashCode ^
      name.hashCode ^
      email.hashCode ^
      avatar.hashCode ^
      status.hashCode ^
      qrCode.hashCode ^
      uniqueID.hashCode ^
      session.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      rotation.hashCode ^
      friendshipStatus.hashCode ^
      idFriendship.hashCode ^
      idAvatar.hashCode;
  }
}