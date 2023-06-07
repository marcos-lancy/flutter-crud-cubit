import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/screens/cubit/categoria_state.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  final CategoriaService service;

  CategoriaCubit({required this.service}) : super(InitialCategoriaState([]));

  Future<void> adicionaCategoria({required CategoriaModel categoria}) async {
    emit(LoadingCategoriaState());

    service.register(categoria);

    await consultarCategorias();
  }

  Future<void> consultarCategorias() async {
    try {
      emit(LoadingCategoriaState());

      final lista = await service.consultarCategorias();

      emit(LoadedCategoriaState(lista));
    } catch (e) {
      //emite o terceiro state
      emit(ErrorCategoriaState('erro teste'));
    }
  }

  Future<void> removeTodo({required int index}) async {
    emit(LoadingCategoriaState());

    await Future.delayed(const Duration(seconds: 1));

    emit(LoadedCategoriaState([]));
  }
}


// class CategoriaCubit extends Cubit<CategoriaState> {
//   final CategoriaService service;

//   CategoriaCubit({required this.service}) : super(InitialState());

//   void cadastrarCategoria(CategoriaModel categoria) async {
//     try {
//       //emite o primeiro state
//       emit(LoadingState());

//       final cat = await service.register(categoria);

//       //emite o segundo state
//       emit(SuccessState(cat));
//     } catch (e) {
//       //emite o terceiro state
//       emit(ErrorState());
//     }
//   }

//   void consultarCategorias() async {
//     try {
//       //emite o primeiro state
//       emit(LoadingState());

//       final lista = await service.consultarCategorias();

//       emit(LoadedState(lista));
//     } catch (e) {
//       //emite o terceiro state
//       emit(ErrorState());
//     }
//   }
// }
