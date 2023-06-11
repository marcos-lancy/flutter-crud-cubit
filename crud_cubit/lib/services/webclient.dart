import 'package:crud_cubit/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class Webclient {
  //static const String url = "http://127.0.0.1:5000/";
  static const String url = "http://192.168.1.8/";

  http.Client client = InterceptedClient.build(
      interceptors: [LoggingInterceptor()],
      requestTimeout: const Duration(seconds: 5));
}
