import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  //

  final CategoriaService service;
  // essa é privada. Como acessar ela?
  final List<CategoriaModel> _categorias = [];

  //List<CategoriaModel> get categorias => _categorias;
  // Acessar atraves desta aqui
  CategoriaCubit({required this.service}) : super(InitialCategoriaState());

  addTodo({required CategoriaModel categoria}) async {
    // emitir primeiro estado
    emit(LoadingCategoriaState());

    await Future.delayed(const Duration(seconds: 1));
    service.register(categoria); // adiciona o novo dado
    _categorias.add(categoria);
    emit(LoadedCategoriaState(_categorias)); //emite o estado que adicionatá

    //  if (_categorias.contains(categoria)) {
    //    emit(ErrorCategoriaState('vc ja adicionou esta tarefa'));
    //  } else {
    //  }
  }

  Future<void> consultarCategorias() async {
    try {
      //emite o primeiro state
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

    _categorias.removeAt(index);

    emit(LoadedCategoriaState(_categorias));
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
