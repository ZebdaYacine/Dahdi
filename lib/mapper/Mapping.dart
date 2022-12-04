import '../model/PostModel.dart';


class Mapping{

  static Map<String,dynamic>  postModelToJson(PostModel posts){
    return {"userId":posts.userId,"title":posts.title};
  }

  static PostModel jsonToPostsModel(dynamic json){
    return PostModel(id: json['id'],userId:  json['userId']
        ,title: json['title'],body: json['body']);
  }

}
