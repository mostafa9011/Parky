import 'package:dio/dio.dart';
import 'package:parky/features/profile/data/models/user_model.dart';

import '../../../../core/api/dio_consumer.dart';

class ProfileRemoteDataSource {
  final _dioConsumer = DioConsumer(dio: Dio());

  Future<List<UserModel>> getAllUsers() async {
    List<dynamic> response = await _dioConsumer.get(path: '/api/users/');
    List<UserModel> users = [];
    for (var element in response) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }
}
