import 'package:crud_cubit/models/categoria_model.dart';

abstract class CategoriaState {}

class InitialCategoriaState extends CategoriaState {
  final List<CategoriaModel> categorias;

  InitialCategoriaState(this.categorias);
}

class LoadingCategoriaState extends CategoriaState {}

class LoadedCategoriaState extends CategoriaState {
  final List<CategoriaModel> categorias;

  LoadedCategoriaState(this.categorias);
}

class ErrorCategoriaState extends CategoriaState {
  final String message;

  ErrorCategoriaState(this.message);
}
