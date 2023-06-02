class CategoriaModel {
  String id;
  String nome;

  CategoriaModel({required this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {"id": id, "nome": nome};
  }

  @override
  // TODO: implement props
  List<Object?> get props => [nome];
}
