import 'package:dio/dio.dart';
import 'package:dio_project/model/users.dart';
import 'package:dio_project/userPosts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> userList = [];

  Future<List<User>> fetchUsers() async {
    var dio = Dio();
    var response = await dio.get('https://jsonplaceholder.typicode.com/users');
    for (var user in response.data) {
      userList.add(User.fromJson(user));
    }
    return userList;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var user in userList)
                InkWell(
                  onTap: (() {
                    Get.to(Post(userId: user.id!, name: user.name!));
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
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(children: [
                                    Text(user.name!),
                                    Text(user.email!),
                                  ]))
                            ]),
                          )
                        ],
                      )),
                ),
            ],
          ),
        ));
  }
}
