import 'package:dio/dio.dart';
import 'package:dio_project/Getx/postsList.dart';
import 'package:dio_project/model/users.dart';
import 'package:get/get.dart';

import 'package:dio_project/model/posts.dart';

class PostsController extends GetxController {
  User singleUser = Get.arguments;
  late int userId = singleUser.id!;
  late RxString username = singleUser.name!.obs;
  static PostsController get to => Get.find();

  final postList = <Posts>[].obs;

  Future<List<Posts>> fetchPosts() async {
    try {
      var dio = Dio();
      var response = await dio
          .get('https://jsonplaceholder.typicode.com/posts?userId=$userId');
      for (var post in response.data) {
        postList.add(Posts.fromJson(post));
        postList.sort((a, b) => a.title!.length.compareTo(b.title!.length));
      }
    } catch (e) {
      print(e);
    }

    return postList;
  }

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }
}
