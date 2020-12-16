import 'package:ci_manager/CIMUser.dart';
import 'package:get/get.dart';

class Controller extends GetxController{
  RxBool authorised = false.obs;
  bool isAuthorised() => authorised.value;
  void authorise(CIMUser user){
    //TODO: Implement authorisation procedure
    authorised.value = true;
  }
}