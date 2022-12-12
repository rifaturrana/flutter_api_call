import 'package:dio_project/controllers/postsController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final PostsController postsController = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Obx(() => Text(postsController.username.toString()))),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Obx(
            () => postsController.postList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      for (var post in postsController.postList)
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                // color: Colors.grey,
                                child: Row(children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.person),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    post.title.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                // color: Colors.grey,
                                child: Row(children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(Icons.person),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    post.body.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
          ),
        ],
      )),
    );
  }
}
