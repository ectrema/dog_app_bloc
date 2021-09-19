// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginRepository implements LoginRepository {
  _LoginRepository(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://reqres.in/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<dynamic> postLogin(email, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': email, 'password': password};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
