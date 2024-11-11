class PredicaoEntity {
  int predicao;

  PredicaoEntity(this.predicao);

  factory PredicaoEntity.fromJson(Map<String, dynamic> json) {
    PredicaoEntity predicao = PredicaoEntity(json["predicao"] as int);
    return predicao;
  }
}
