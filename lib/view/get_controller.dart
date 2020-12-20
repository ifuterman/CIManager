import 'package:ci_manager/CIMUser.dart';
import 'package:ci_manager/view/get_view_model.dart';
import 'package:get/get.dart';

enum CIMViews{
  authorisation_view,
  connection_view,
  main_view
}

class Controller extends GetxController{
  Rx<CIMViews> currentView = Rx(CIMViews.authorisation_view);
  AuthorisationViewModel authViewModel = AuthorisationViewModel();
  ConnectionViewModel connectionViewModel = ConnectionViewModel();
  RxBool authorised = false.obs;
  bool isAuthorised() => authorised.value;
  void authorise(CIMUser user){
    //TODO: Implement authorisation procedure
    authorised.value = true;
  }
  void onConnectionChanged(bool connectionOk, String newServer){
    currentView.value = CIMViews.authorisation_view;
    //TODO: Implement connection
  }
}