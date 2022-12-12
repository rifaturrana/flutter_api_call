import 'package:dio/dio.dart';
import 'package:dio_project/controllers/userController.dart';
import 'package:dio_project/model/users.dart';
import 'package:dio_project/Getx/postsList.dart';
import 'package:dio_project/userPosts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserList extends StatefulWidget {
  const UserList({super.key, required this.title});

  final String title;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final UserContorller userContorller = Get.put(UserContorller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => userContorller.userList.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          for (var user in userContorller.userList)
                            InkWell(
                              onTap: (() {
                                Get.to(() => PostList(), arguments: user);
                              }),
                              child: Container(
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
                                              user.name! + "\n " + user.email!),
                                        ]),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  )),
                            ),
                        ],
                      ),
              )
            ],
          ),
        ));
  }
}
