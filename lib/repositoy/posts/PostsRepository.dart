import 'package:dahdi/model/PostModel.dart';

abstract class PostsRepository{

  Future<List<PostModel>> getAllPosts();

  Future<List<PostModel>> getPostById(int id);

}