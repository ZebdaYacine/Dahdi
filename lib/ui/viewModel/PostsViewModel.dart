import 'package:dahdi/domain/model/PostModel.dart';
import 'package:dahdi/domain/repositoy/Repository.dart';
import 'package:dahdi/ui/viewModel/PostViewModel.dart';
import 'package:flutter/material.dart';

class PostsViewModel {
  final title = "All Posts";
  PostsRepository? postsRepository;

  PostsViewModel({this.postsRepository});

  List<PostViewModel> listVm = [];

  Future<List<PostViewModel>> fetchAllPosts() async {
    List<PostModel> list = await postsRepository!.getAllPosts();
    for (var element in list) {
      listVm.add(PostViewModel(postModel: element));
    }
    return listVm;
  }

  Future<List<PostViewModel>> fetchPostById(int id) async {
    print(">>>>>>>>>>>>>> this is fetchPostById $id");
    List<PostModel> list = await postsRepository!.getPostById(id);
    return list.map((e) => PostViewModel(postModel: e)).toList();
  }
}
