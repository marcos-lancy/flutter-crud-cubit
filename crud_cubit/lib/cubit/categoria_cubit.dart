import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriaCubit extends Cubit<CategoriaState> {
  CategoriaCubit({this.service}) : super(InitialState())

  final CategoriaService service;
}