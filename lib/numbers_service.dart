import 'package:dio/dio.dart';

const String _baseUrl = 'https://random-data-api.com/api';

class NumbersService {
  factory NumbersService.filled() {
    final Dio dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
    ));
    return NumbersService._(dio);
  }

  NumbersService._(this._dio);

  final Dio _dio;

  Future<int> getRandomInt() async {
    final Response<dynamic> response = await _dio.get('/number/random_number');
    return (response.data['decimal'] as double).toInt();
  }
}
