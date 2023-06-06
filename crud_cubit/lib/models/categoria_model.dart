class CategoriaModel {
  String id;
  String nome;

  CategoriaModel({required this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {"id": id, "nome": nome};
  }

  CategoriaModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"];

  @override
  // TODO: implement props
  List<Object?> get props => [nome];
}
