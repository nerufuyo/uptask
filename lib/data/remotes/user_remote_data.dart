import 'dart:developer';

import 'package:uptask/core/core.dart';
import 'package:uptask/domain/domain.dart';

class UserRemoteData {
  final DioNetworkService _dioNetworkService = getIt<DioNetworkService>();

  UserRemoteData();

  Future<Map<String, dynamic>> _makeRequest(
    String endpoint, {
    String method = 'GET',
    dynamic data,
  }) async {
    final response = await _dioNetworkService.request(
      endpoint,
      method: method,
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getUserById(String id) async {
    final response = await _makeRequest('users/$id');
    return UserEntity.fromJson(response).toJson();
  }

  Future<Map<String, dynamic>> login(
    String username,
    String email,
    String password,
  ) async {
    final response = await _makeRequest('login', method: 'POST', data: {
      'username': username,
      'email': email,
      'password': password,
    });

    log('login response: $response');
    return TokenEntity.fromJson(response).toJson();
  }

  Future<Map<String, dynamic>> register(
    String username,
    String email,
    String password,
  ) async {
    final response = await _makeRequest('register', method: 'POST', data: {
      'username': username,
      'email': email,
      'password': password,
    });

    log('register response: $response');
    return UserEntity.fromJson(response).toJson();
  }
}
