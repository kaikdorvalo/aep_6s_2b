import 'dart:convert';

import 'package:front/domain/password_entity.dart';
import 'package:front/domain/predicao_entity.dart';
import 'package:front/service/abstract_api.dart';

class PasswordService extends AbstractApi {
  PasswordService(super._recurso, super.http);

  Future<PredicaoEntity> verifyPassword(PasswordEntity password) async {
    var res = await create(password);
    PredicaoEntity predicao = PredicaoEntity.fromJson(jsonDecode(res.body));

    return predicao;
  }
}
