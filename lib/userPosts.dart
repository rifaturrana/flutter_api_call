import 'package:dio/dio.dart';
import 'package:dio_project/model/posts.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final int userId;
  final String name;
  const Post({super.key, required this.userId, required this.name});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  List<Posts> postList = [];
  Future<List<Posts>> fetchPosts() async {
    var response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts?userId=${widget.userId}');
    for (var p in response.data) {
      postList.add(Posts.fromJson(p));
    }
    return postList;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var post in postList)
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
                      child: Column(children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            post.title.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            post.body.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 14),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
