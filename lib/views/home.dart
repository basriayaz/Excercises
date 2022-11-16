import 'package:apiapp/models/exercises_api.dart';
import 'package:apiapp/models/exercises_model.dart';
import 'package:apiapp/views/widgets/exercises_card.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Post>? posts;
var isLoaded = false;

@override
  void initState() {
    super.initState();
  getData();

  }

  getData({String? searchQuery}) async {
   posts = await RemoteService().getPosts(searchQuery:searchQuery);
  if(posts != null){
    setState(() {
      isLoaded = true;
    });
  }
  
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: scrollView(),
    );
  }

  NestedScrollView scrollView() {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: ((context, innerBoxIsScrolled) => [
         sliverAppBar()

      ]),
      body: isLoaded ? ListView.builder(itemCount: posts?.length, itemBuilder: ((context, index) => 
      ExercisesCard(title: posts![index].name, keywords: posts![index].muscle, type: posts![index].type)),
    ):const Center(child: CircularProgressIndicator()),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
        backgroundColor: Colors.white,
        title: Row(children: [Expanded(
          flex: 15,
          child: TextField(
          onChanged:(value) => getData(searchQuery: value),
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search Exercises",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white,
            ),
          ),
        ),
        const Expanded(flex:1,child: Icon(Icons.filter_list,color: Colors.black,))
        
        ],)
        
      );
  }
}
