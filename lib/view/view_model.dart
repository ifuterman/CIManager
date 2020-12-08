/*enum RightViewRegime{
  REGIME_USER,
  REGIME_PATIENT,
  REGIME_SCHEDULE,
  REGIME_PROTOCOL
}*/


import 'package:rxdart/rxdart.dart';


enum LeftListViewID{
  ITEM_PATIENTSLIST,
  ITEM_SCHEDULE,
  ITEM_USER,
  ITEM_PROTOCOLS,
  ITEM_SETTINGS
}

class ViewModel {
 /* RightViewRegime _viewRegime;
  RightViewRegime get viewRegime => _viewRegime;
  set viewRegime(RightViewRegime value) =>_viewRegime = value;*/

  LeftListViewID _selectedID = LeftListViewID.ITEM_USER;
  LeftListViewID get selectedID => _selectedID;

//  set selectedID(LeftListViewID value) => _selectedID = value;
  Future<void> onMenuItemSelected(LeftListViewID id) async {
    if(_selectedID == id)
      return;
    _selectedID = id;
    onMenuChanged.add(id);
  }

  bool isMenuItemSelected(LeftListViewID id) => id == _selectedID ? true : false;

  bool _authorized = false;
  bool isAuthorized() => _authorized;

  final BehaviorSubject<LeftListViewID> onMenuChanged = BehaviorSubject<LeftListViewID>.seeded(LeftListViewID.ITEM_USER);
  final BehaviorSubject<bool> onAuthorizedChanged = BehaviorSubject<bool>.seeded(false);

  UserAuthorizationViewModel _authorizationViewModel = UserAuthorizationViewModel();

  UserAuthorizationViewModel get authorizationViewModel =>
      _authorizationViewModel;
  Future authorizeUser() async{
    //TODO:Implement user authorization
    _authorized = true;
    onAuthorizedChanged.add(_authorized);
  }
}
final viewModel = ViewModel();//Типа синглтон

class UserAuthorizationViewModel
{
  String userName = "";
  String userPassword = "";
}