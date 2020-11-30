/*enum RightViewRegime{
  REGIME_USER,
  REGIME_PATIENT,
  REGIME_SCHEDULE,
  REGIME_PROTOCOL
}*/

import 'package:flutter/cupertino.dart';

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

  LeftListViewID _selectedID;
  LeftListViewID get selectedID => _selectedID;
  set selectedID(LeftListViewID value) => _selectedID = value;

  void selectMenuItem(LeftListViewID id){
    _selectedID = id;
  }
  bool isMenuItemSelected(LeftListViewID id) => id == _selectedID ? true : false;

  bool _autorized = false;
  bool isAuthorized() => _autorized;
}
final viewModel = ViewModel();//Типа синглтон