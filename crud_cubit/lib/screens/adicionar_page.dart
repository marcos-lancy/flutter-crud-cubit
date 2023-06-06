import 'package:crud_cubit/cubit/categoria_cubit.dart';
import 'package:crud_cubit/screens/adicionar_screen.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdicionarPage extends StatelessWidget {
  final CategoriaCubit cubit;
  static String routename = '/adiciona';
  const AdicionarPage({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return AdicionaScreen(cubit: cubit);
  }
}
