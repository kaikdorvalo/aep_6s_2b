import 'package:flutter/foundation.dart';

class PasswordEntity {
  String password;

  PasswordEntity(this.password);

  // factory PasswordEntity.fromJson(Map<String, dynamic> json) {
  //   PasswordEntity password = PasswordEntity(passClass: json['pass']);
  //   return password;
  // }

  Map<String, dynamic> toJson() {
    return {
      'passw': password,
    };
  }
}
