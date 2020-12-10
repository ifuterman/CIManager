
import 'package:rxdart/rxdart.dart';


enum LeftListViewID{
  ITEM_PATIENTSLIST,
  ITEM_SCHEDULE,
  ITEM_USER,
  ITEM_PROTOCOLS,
  ITEM_SETTINGS
}

class ViewEvent{

}

class ItemSelectedViewEvent extends ViewEvent{
  LeftListViewID id;
  ItemSelectedViewEvent(this.id);
}

class AuthorizationViewEvent extends ViewEvent{
  bool authorized;
  AuthorizationViewEvent(this.authorized);
}

class InitialisationViewEvent extends ViewEvent{

}

class ViewModel {


  LeftListViewID _selectedID = LeftListViewID.ITEM_USER;
  LeftListViewID get selectedID => _selectedID;

  Future<void> onMenuItemSelected(LeftListViewID id) async {
    if(_selectedID == id)
      return;
    _selectedID = id;
//
    onEventRised.add(ItemSelectedViewEvent(id));
  }

  bool isMenuItemSelected(LeftListViewID id) => id == _selectedID ? true : false;

  bool _authorized = false;
  bool isAuthorized() => _authorized;

  /*final BehaviorSubject<ViewEvent> onMenuChanged = BehaviorSubject<ViewEvent>.seeded(ItemSelectedViewEvent(LeftListViewID.ITEM_USER));
  final BehaviorSubject<ViewEvent> onAuthorizedChanged = BehaviorSubject<ViewEvent>.seeded(AuthorizationViewEvent(false));*/
  final BehaviorSubject<ViewEvent> onEventRised = BehaviorSubject<ViewEvent>();

  UserAuthorizationViewModel _authorizationViewModel = UserAuthorizationViewModel();

  UserAuthorizationViewModel get authorizationViewModel =>
      _authorizationViewModel;
  Future authorizeUser() async{
    //TODO:Implement user authorization
    _authorized = true;
//    onAuthorizedChanged.add(AuthorizationViewEvent(_authorized));
    onEventRised.add(AuthorizationViewEvent(_authorized));
  }
}
final viewModel = ViewModel();//Типа синглтон

class UserAuthorizationViewModel
{
  String userName = "";
  String userPassword = "";
}