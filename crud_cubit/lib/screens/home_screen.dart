import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/screens/adicionar_screen.dart';
import 'package:crud_cubit/screens/cubit/categoria_cubit.dart';
import 'package:crud_cubit/screens/cubit/categoria_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  late final CategoriaCubit cubit;
  static String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<CategoriaCubit>(context)..consultarCategorias();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdicionaScreen(
                  cubit: context.read<CategoriaCubit>(),
                ),
              ),
            ),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadedCategoriaState) {
            return _MeuCard(categorias: state.categorias);
          } else if (state is LoadingCategoriaState) {
            return const Center(child: CircularProgressIndicator());
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
