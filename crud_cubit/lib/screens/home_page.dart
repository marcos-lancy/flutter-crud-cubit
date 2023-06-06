import 'package:crud_cubit/cubit/categoria_cubit.dart';
import 'package:crud_cubit/screens/home_screen.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home';
  final CategoriaService service;
  const HomePage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriaCubit(service: service)..consultarCategorias(),
      child: const HomeScreen(),
    );
  }
}
