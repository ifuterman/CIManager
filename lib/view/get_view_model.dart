import 'package:ci_manager/CIMPatient.dart';
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

class PatientsScreenModel{
  List<PatientItem> patientItems = List();
}

class PatientItem{
  CIMPatient patient = CIMPatient();
  RxBool isExpanded = RxBool(false);
}