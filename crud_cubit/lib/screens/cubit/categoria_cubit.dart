import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  final CategoriaService service;

  CategoriaCubit({required this.service}) : super(InitialState());

  void cadastrarCategoria(CategoriaModel categoria) async {
    try {
      //emite o primeiro state
      emit(LoadingState());

      final cat = await service.register(categoria);

      //emite o segundo state
      emit(SuccessState(cat));
    } catch (e) {
      //emite o terceiro state
      emit(ErrorState());
    }
  }
}
