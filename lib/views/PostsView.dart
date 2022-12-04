import 'package:dahdi/repositoy/posts/PostsAPI.dart';
import 'package:dahdi/viewModel/PostsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterx_live_data/flutterx_live_data.dart';
import 'package:grouped_list/grouped_list.dart';

import '../viewModel/PostViewModel.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<StatefulWidget> createState() {
    return PostsStat();
  }
}

class PostsStat extends State<PostsView> {
  var data = PostsViewModel(postsRepository: PostsAPI());
  late Future<List<PostViewModel>> useFuture;

  @override
  void initState() {
    super.initState();
    useFuture = Future.value([PostViewModel()]);
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
          TextField(
            onChanged: (text) {
              setState(() {
                if (text.isNotEmpty) {
                  useFuture = data.fetchPostById(int.parse(text));
                } else {
                  useFuture = data.fetchAllPosts();
                }
              });
            },
            decoration: const InputDecoration(
              hintText: "write Id",
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  useFuture = data.fetchAllPosts();
                });
              },
              child: const Text("get all post")),
          Expanded(
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
                          color: Colors.deepOrangeAccent,
                          child: Row(
                            children: [
                              Text("the userId ${posts?[index].id}"),
                              IconButton(
                                icon: const Icon(Icons.file_copy_rounded),
                                onPressed: () {
                                  Fluttertoast.showToast(
                                      msg: "${posts?[index].id}",
                                      fontSize: 16.0);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          )
        ]),
      ),
    );
  }
}
