import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final int counter;

  const UserModel({
    this.id = 0,
    this.name = "",
    this.username = "",
    this.email = "",
    this.counter = 0,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    int? counter,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      counter: counter ?? this.counter,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
