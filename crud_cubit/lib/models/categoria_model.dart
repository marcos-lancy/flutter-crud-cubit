import 'package:equatable/equatable.dart';

class CategoriaModel extends Equatable {
  String nome;

  CategoriaModel({required this.nome});

  @override
  // TODO: implement props
  List<Object?> get props => [nome];
}