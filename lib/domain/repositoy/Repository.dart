import 'package:dahdi/domain/model/PostModel.dart';

abstract class PostsRepository{

  Future<List<PostModel>> getAllPosts();

  Future<List<PostModel>> getPostById(int id);

}