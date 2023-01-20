

import 'package:dahdi/domain/model/LoginModel.dart';

class LoginViewModel{

  String title= "Welcome at Dhadi App";
  var loginModel= LoginModel();

  getCounter(){
    return loginModel.counter;
  }

  inc(){
    return loginModel.counter++;
  }

}