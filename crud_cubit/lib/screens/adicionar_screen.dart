import 'dart:math';

import 'package:crud_cubit/cubit/categoria_cubit.dart';
import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdicionaScreen extends StatelessWidget {
  static String routename = '/adiciona';
  final CategoriaService serv;

  AdicionaScreen({Key? key, required this.serv}) : super(key: key);

  final TextEditingController _categoriaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int _id = Random().nextInt(1000);
    final _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => CategoriaCubit(service: serv),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Adiciona'),
        ),
        body: BlocBuilder<CategoriaCubit, CategoriaState>(
          builder: (context, state) {
            final cubit = context.read<CategoriaCubit>();
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
                          if (_categoriaController.text != null &&
                              _categoriaController.text != "") {
                            CategoriaModel categoria = CategoriaModel(
                                id: _id.toString(),
                                nome: _categoriaController.text);
                            cubit.cadastrarCategoria(categoria);
                          }
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
      ),
    );
  }
}
