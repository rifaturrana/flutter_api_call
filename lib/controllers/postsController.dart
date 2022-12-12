import 'package:dio/dio.dart';
import 'package:dio_project/model/users.dart';
import 'package:get/get.dart';

import 'package:dio_project/model/posts.dart';

class PostsController extends GetxController {
  User user = Get.arguments;
  late int? userId = user.id;
  late RxString username = user.name!.obs;
  static PostsController get to => Get.find();

  final postList = <Posts>[].obs;

  Future<List<Posts>> fetchPosts() async {
    var response = await Dio()
        .get("https://jsonplaceholder.typicode.com/posts?userId=$userId");
    for (var p in response.data) {
      postList.add(Posts.fromJson(p));
    }
    print(postList);

    return postList;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}
