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
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      postsController.fetchPosts();
    });
  }

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
                          width: MediaQuery.of(context).size.width,
                          // margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        post.title!,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        post.body!,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
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
