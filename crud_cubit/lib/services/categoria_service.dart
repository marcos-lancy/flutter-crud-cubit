import 'dart:convert';
import 'dart:io';

import 'package:crud_cubit/models/categoria_model.dart';
import 'package:crud_cubit/services/webclient.dart';
import 'package:http/http.dart' as http;

class CategoriaService {
  String url = Webclient.url;
  http.Client client = Webclient().client;

  static const String resource = "categorias/";

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(CategoriaModel categoria) async {
    String jsonCategoria = json.encode(categoria.toMap());

    http.Response response = await client.post(
      Uri.parse(getUrl()),
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonCategoria,
    );

    if (response.statusCode != 201) {
      if (json.decode(response.body) == "jwt expired") {}

      throw HttpException(response.body);
    }

    return true;
  }

  Future<List<CategoriaModel>> consultarCategorias() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    if (response.statusCode != 200) {}

    List<CategoriaModel> list = [];

    List<dynamic> listDynamic = json.decode(response.body);

    for (var jsonMap in listDynamic) {
      list.add(CategoriaModel.fromMap(jsonMap));
    }

    return list;
  }

  Future<bool> deleteCategoria({required String id}) async {
    http.Response response =
    await client.delete(Uri.parse("${getUrl()}$id"), headers: {
      'Content-type': 'application/json'
    });

    if (response.statusCode != 200) {
      throw HttpException(response.body);
    }

    return true;
  }
}