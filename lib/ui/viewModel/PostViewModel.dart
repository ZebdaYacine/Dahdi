import 'package:dahdi/domain/model/PostModel.dart';


class PostViewModel {
  PostModel? postModel;
  PostViewModel({this.postModel});

  get id => postModel?.id;
  get userId => postModel?.userId;
  get title => postModel?.title;
  get body => postModel?.body;


}