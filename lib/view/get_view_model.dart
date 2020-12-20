import 'package:get/get.dart';

class AuthorisationViewModel{
  String user = "";
}

class ConnectionViewModel{
  String address = "";
  RxBool connected = RxBool(false);
  bool isConnected()=> connected.value;
  bool checkConnection(){
    //TODO:Implement connection check
    connected.value = true;
  }
}