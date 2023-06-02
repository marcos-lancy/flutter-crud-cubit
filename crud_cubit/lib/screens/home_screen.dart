import 'package:crud_cubit/cubit/categoria_cubit.dart';
import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/screens/adicionar_screen.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  final CategoriaService serv;
  const HomeScreen({Key? key, required this.serv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriaCubit(service: serv),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AdicionaScreen.routename),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: BlocBuilder<CategoriaCubit, CategoriaState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [],
              ),
            );
          },
        ),
      ),
    );
  }
}
