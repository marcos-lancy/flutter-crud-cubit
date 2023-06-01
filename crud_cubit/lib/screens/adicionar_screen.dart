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
    );
  }
}
