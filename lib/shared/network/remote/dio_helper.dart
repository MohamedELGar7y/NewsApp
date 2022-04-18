import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required dynamic query,
})async
  {
    return await dio!.get(
        url,
        queryParameters: query,
    );
  }
}

////https://newsapi.org/
// v2/everything?
// q=tesla&
// from=2021-11-24&
// sortBy=publishedAt&apiKey=API_KEY







///////https://newsapi.org/
// v2/top-headlines?
// country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

///https://newsapi.org/
///v2/everything?q=tesla&apiKey=cc9d7126350642d6b6b7f7e1b28bee0d