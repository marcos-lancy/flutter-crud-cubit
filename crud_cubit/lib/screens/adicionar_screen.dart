import 'dart:math';

import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/screens/cubit/categoria_cubit.dart';
import 'package:crud_cubit/screens/cubit/categoria_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdicionaScreen extends StatelessWidget {
  static String routename = '/adiciona';
  late final CategoriaCubit cubit;

  AdicionaScreen({Key? key, required this.cubit}) : super(key: key);

  final TextEditingController _categoriaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int _id = Random().nextInt(1000);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adiciona'),
      ),
      body: BlocBuilder<CategoriaCubit, CategoriaState>(
        bloc: cubit,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value == "") {
                        return 'Informe o Nome';
                      }
                    },
                    controller: _categoriaController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.category), labelText: 'Categoria'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        CategoriaModel categoria = CategoriaModel(
                            id: _id.toString(),
                            nome: _categoriaController.text);

                        cubit.adicionaCategoria(categoria: categoria);

                        Navigator.pop(context);
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
