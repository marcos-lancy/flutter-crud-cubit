import 'package:crud_cubit/cubit/categoria_cubit.dart';
import 'package:crud_cubit/cubit/categoria_state.dart';
import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/screens/adicionar_page.dart';
import 'package:crud_cubit/screens/adicionar_screen.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AdicionaScreen(cubit: context.read<CategoriaCubit>(),),
              ),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder<CategoriaCubit, CategoriaState>(
        builder: (context, state) {
          if (state is InitialCategoriaState) {
            return const Center(
              child: Text('Nenhuma categoria foi adicionada ainda'),
            );
          } else if (state is LoadingCategoriaState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedCategoriaState) {
            return _MeuCard(
                categorias: state.categorias); // recebemos a variavel do state
          } else {
            return const _MeuCard(
                categorias: []); // mesmo que ocorra erro. é possivel resgatar a lista que ja estava carregada.
          }
        },
      ),
    );
  }
}

class _MeuCard extends StatelessWidget {
  final List<CategoriaModel> categorias;
  const _MeuCard({super.key, required this.categorias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Center(
              child: Text(categorias[index].nome[0]),
            ),
          ),
          title: Text(categorias[index].nome),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
