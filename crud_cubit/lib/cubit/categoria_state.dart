import 'package:crud_cubit/models/categoria_model.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriaState {}

class InitialCategoriaState extends CategoriaState {}

class LoadingCategoriaState extends CategoriaState {}

class LoadedCategoriaState extends CategoriaState {
  final List<CategoriaModel> categorias;

  LoadedCategoriaState(this.categorias);
}

class ErrorCategoriaState extends CategoriaState {
  final String message;

  ErrorCategoriaState(this.message);
}









// abstract class CategoriaState extends Equatable {}

// class InitialState extends CategoriaState {
//   @override
//   List<Object> get props => [];
// }

// class LoadingState extends CategoriaState {
//   @override
//   List<Object> get props => [];
// }

// class SuccessState extends CategoriaState {
//   SuccessState(this.sucesso);

//   final bool sucesso;
//   @override
//   List<Object> get props => [];
// }

// class LoadedState extends CategoriaState {
//   LoadedState(this.categorias);

//   final List<CategoriaModel> categorias;

//   @override
//   List<Object> get props => [categorias];
// }

// class ErrorState extends CategoriaState {
//   @override
//   List<Object> get props => [];
// }
