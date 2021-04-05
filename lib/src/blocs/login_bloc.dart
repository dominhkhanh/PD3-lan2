
import 'dart:async';

import 'package:App/src/fire_base/fire_base_auth.dart';
import 'package:App/src/validator/validations.dart';

class LoginBloc {
var _firAuth  = FirAuth();

  StreamController _userController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get  userStream => _userController.stream;
  Stream get passStream => _passController.stream;


  bool isValidInfo( String  username, String  pass ){
    if (!Validation.isValidUser(username)){
      _userController.sink.addError("tai khoan khong hop le");
      return false;

    }
    _userController.sink.add("OK");
    if (!Validation.isValidPass( pass)){
      _passController.sink.addError("Password phai tren 10 ki tu  ");
      return false;
    }

    
    _passController.sink.add("Ok");
    return true;
  }
 void signUp(String username, String pass, Function onSuccess){
    _firAuth.sigUp(username, pass, onSuccess);
 }
  void dispose(){
    _userController.close();
    _passController.close();
  }
}