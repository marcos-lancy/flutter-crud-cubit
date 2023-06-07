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
      emit(ErrorCategoriaState('erro state'));
    }
  }

  Future<void> removeCategoria({required String index}) async {
    try{
      emit(LoadingCategoriaState());

      await Future.delayed(const Duration(seconds: 1));

      await service.deleteCategoria(id: index);

      final lista = await service.consultarCategorias();

      emit(LoadedCategoriaState(lista));

    } catch (e) {
      emit(ErrorCategoriaState('erro state'));
    }
  }
}
