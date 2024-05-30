import 'package:example_30_may_24/app/module/user/home/model/home_model.dart';
import 'package:example_30_may_24/app/module/user/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final HomeViewModel homeVM = Get.find();

  @override
  void initState() {
    super.initState();
    homeVM.jokeListApi();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes'),
        automaticallyImplyLeading: false, // Remove back button
      ),
      body: homeVM.jokeList.value.id == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(homeVM.jokeList.value.setup ?? ""),
            subtitle: Text(homeVM.jokeList.value.punchline ?? ""),
            onTap: () {
              // Handle onTap if needed
            },
          );
        },
      ),
    );
  }
}
