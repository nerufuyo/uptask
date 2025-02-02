import 'package:dartz/dartz.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/data/data.dart';

class AuthRepository {
  final UserRemoteData _userRemoteData = getIt<UserRemoteData>();

  AuthRepository();

  Future<Either<String, dynamic>> getUserById({required String id}) =>
      DartzTryCatch.network(
        () async {
          final response = await _userRemoteData.getUserById(id);

          if (response.isNotEmpty) return response;

          throw Exception('GET USER BY ID: Data is empty!');
        },
      );

  Future<Either<String, dynamic>> getTokenByLogin({
    required String email,
    required String password,
  }) =>
      DartzTryCatch.network(
        () async {
          final response = await _userRemoteData.login(email, password);

          if (response.isNotEmpty) return response;

          throw Exception('GET TOKEN BY LOGIN: Data is empty!');
        },
      );

  Future<Either<String, dynamic>> getTokenByRegister({
    required String email,
    required String password,
  }) =>
      DartzTryCatch.network(
        () async {
          final response = await _userRemoteData.register(email, password);

          if (response.isNotEmpty) return response;

          throw Exception('GET TOKEN BY REGISTER: Data is empty!');
        },
      );
}
