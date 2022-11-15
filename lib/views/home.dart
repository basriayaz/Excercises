import 'package:apiapp/models/exercises_api.dart';
import 'package:apiapp/models/exercises_model.dart';
import 'package:apiapp/views/widgets/exercises_card.dart';
import 'package:flutter/material.dart';

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

  getData() async {
   posts = await RemoteService().getPosts();
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
    ):Center(child: CircularProgressIndicator()),
    );
  }

  SliverAppBar sliverAppBar() {
    return SliverAppBar(
        backgroundColor: Colors.white,
        title: Row(children:const [Expanded(
          flex: 15,
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search Exercises",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white,
            ),
          ),
        ),
        Expanded(flex:1,child: Icon(Icons.filter_list,color: Colors.black,))
        
        ],)
        
      );
  }
}
