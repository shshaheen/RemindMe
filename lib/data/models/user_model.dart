import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String username;
  final String email;

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Converts this data model to its pure domain Entity counterpart
  User toDomain() {
    return User(
      id: id,
      username: username,
      email: email,
    );
  }

  /// Factory constructor to convert a pure domain Entity into this serializable Data Model
  factory UserModel.fromDomain(User user) {
    return UserModel(
      id: user.id,
      username: user.username,
      email: user.email,
    );
  }
}
