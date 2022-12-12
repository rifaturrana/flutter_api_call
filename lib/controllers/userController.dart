import 'package:dio/dio.dart';
import 'package:dio_project/model/users.dart';
import 'package:get/get.dart';

class UserContorller extends GetxController {
  static UserContorller get to => Get.find();
  final userList = <User>[].obs;

  Future<List<User>> fetchUsers() async {
    try {
      var dio = Dio();
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      for (var user in response.data) {
        userList.add(User.fromJson(user));
      }
    } catch (e) {
      print(e);
    }

    return userList;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }
}
