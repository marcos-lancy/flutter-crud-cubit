import 'package:crud_cubit/screens/adicionar_screen.dart';
import 'package:crud_cubit/screens/home_screen.dart';
import 'package:crud_cubit/services/categoria_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(serv: CategoriaService()),
        AdicionaScreen.routename: (context) =>
            AdicionaScreen(serv: CategoriaService()),
      },
    );
  }
}
