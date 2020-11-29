import 'package:singleton/singleton.dart';
import 'model.dart';

enum RightViewRegime{
  REGIME_USER,
  REGIME_PATIENT,
  REGIME_SCHEDULE,
  REGIME_PROTOCOL
}

class Controller {

  RightViewRegime _viewRegime;

  RightViewRegime get viewRegime => _viewRegime;

  set viewRegime(RightViewRegime value) =>_viewRegime = value;

  final Model _model;
  static final Map _widgetKeyMap = new Map();
  factory Controller() => Singleton<Controller>().instance;
  Controller.initialize(this._model){
    Singleton.register(this);
  }

}