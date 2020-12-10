import 'package:singleton/singleton.dart';
import 'model.dart';

class CIM_Event {
  bool isYou(Type t){
    return this.runtimeType == t ? true : false;
  }
}

class Controller {


  final Model _model;
  static final Map _widgetKeyMap = new Map();
  factory Controller() => Singleton<Controller>().instance;
  Controller.initialize(this._model){
    Singleton.register(this);
  }

}