import 'package:flutter/material.dart';

class AdicionaScreen extends StatelessWidget {
  static String routename = '/adiciona';

  const AdicionaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adiciona'),
      ),
      body: Form(
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.category),
                  labelText: 'Categoria'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: (){},
                  child: const Text('Cadastrar'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
