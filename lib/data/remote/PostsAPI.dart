// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:collection';

import 'package:dahdi/data/mapper/Mapping.dart';
import 'package:dahdi/domain/model/PostModel.dart';
import 'package:dahdi/domain/repositoy/Repository.dart';
import 'package:dio/dio.dart';

class PostsAPI extends PostsRepository{
  final  baseUrl="https://jsonplaceholder.typicode.com/posts";
  @override
  Future<List<PostModel>> getAllPosts() async {
    List<PostModel> allPosts=[] ;
    try{
      var response =await Dio().get(baseUrl);
      var list=response.data as List;
      allPosts = list.map((e) => Mapping.jsonToPostsModel(e)).toList();
    }catch(e,s){
      print(e);
      print(s);
    }
    return allPosts;
  }
  @override
  Future<List<PostModel>> getPostById(int id) async{
    List<PostModel> allPosts=[] ;
    try{
      var response =await Dio().get(baseUrl+"/$id");
      var list=response.data as LinkedHashMap;
      allPosts.add(Mapping.jsonToPostsModel(list));
    }catch(e,s){
      print(e);
      print(s);
    }
    return allPosts;
  }
}