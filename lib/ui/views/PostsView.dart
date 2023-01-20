import 'package:dahdi/data/remote/PostsAPI.dart';
import 'package:dahdi/ui/viewModel/PostViewModel.dart';
import 'package:dahdi/ui/viewModel/PostsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostsStat();
  }
}

class PostsStat extends State<PostsView> {
  var data = PostsViewModel(postsRepository: PostsAPI());
  String postId = "";
  late Future<List<PostViewModel>> useFuture;

  @override
  void initState() {
    super.initState();
    useFuture = data.fetchAllPosts();
  }


  String firstChars(String str) {
    int i = 0;
    String word = '';
    while(i<10){
      word=word+str[i];
      i++;
    }
    return word;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(data.title),
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding:
            const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: TextField(
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      useFuture = data.fetchPostById(int.parse(text));
                    } else {
                      useFuture =
                      data.fetchAllPosts();
                    }
                  });
                },
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Search By Post Id")),
          ),
          /*TextButton(
              onPressed: () {
                setState(() {
                  useFuture =
                      data.fetchAllPosts() as Future<List<PostViewModel>>;
                });
              },
              child: const Text("get all post")),*/
          Expanded(
              child: Padding(
                padding:const EdgeInsets.only(left: 10, right: 10),
                child: FutureBuilder<List<PostViewModel>>(
                  future: useFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var posts = snapshot.data;
                      if (posts!.first.id == null) {
                        return const Text("No data loaded");
                      }
                      return ListView.builder(
                        itemCount: posts?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            shadowColor: Colors.black87,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.mail_rounded,size:30),
                                  onPressed: () {
                                    var id = posts?[index].id;
                                    context.go("/detailsPost", extra: "$id");
                                  },
                                ),
                                Text("the userId ${firstChars(posts[index].title)}"),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  }),
              )
          )
        ]),
      ),
    );
  }
}
