// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String userName;
  final String email;
  final String phoneNumer;
  final String id;
  final String password;


  UserModel(
    this.userName,
    this.email,
    this.phoneNumer,
    this.id,
    this.password,
  );

  UserModel copyWith({
    String? userName,
    String? email,
    String? phoneNumer,
    String? id,
    String? password,
  }) {
    return UserModel(
      userName ?? this.userName,
      email ?? this.email,
      phoneNumer ?? this.phoneNumer,
      id ?? this.id,
      password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'email': email,
      'phoneNumer': phoneNumer,
      'id': id,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['userName'] as String,
      map['email'] as String,
      map['phoneNumer'] as String,
      map['id'] as String,
      map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(userName: $userName, email: $email, phoneNumer: $phoneNumer, id: $id, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userName == userName &&
      other.email == email &&
      other.phoneNumer == phoneNumer &&
      other.id == id &&
      other.password == password;
  }

  @override
  int get hashCode {
    return userName.hashCode ^
      email.hashCode ^
      phoneNumer.hashCode ^
      id.hashCode ^
      password.hashCode;
  }
}
