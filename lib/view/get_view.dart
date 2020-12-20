import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:ci_manager/CIMUser.dart';
import 'get_controller.dart';

class CIManagerApp extends StatelessWidget {
  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
//    return Scaffold(body: AuthorisationView());
    return Scaffold(
//      body: Obx(() => c.authorised.value ? MainView() : AuthorisationView())
      body: Obx(()=> getView(c.currentView.value)),

    );
  }

  Widget getView(CIMViews view){
    switch(view){
      case CIMViews.authorisation_view:{
        return AuthorisationView();
      }
      case CIMViews.main_view:{
        return MainView();
      }
      case CIMViews.connection_view:{
        return ConnectionView();
      }
      default:
        return Container();
    }
  }
}

class AuthorisationView extends StatelessWidget {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
    _controllerLogin.text = controller.authViewModel.user;
    return Align(
//          alignment: Alignment.topLeft,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'USERAUTHORIZATIONSCREEN_USERNAME_TITLE'.tr(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.right,
          ),
          Container(
            constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headline6.fontSize * 1.2,
                width: Theme.of(context).textTheme.bodyText1.fontSize * 15),
            child: TextField(
              controller: _controllerLogin,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.authViewModel.user = _controllerLogin.text;
              },
            ),
          ),
          Text(
            'USERAUTHORIZATIONSCREEN_PASSWORD_TITLE'.tr(),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.right,
          ),
          Container(
            constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headline6.fontSize * 1.2,
                width: Theme.of(context).textTheme.bodyText1.fontSize * 15),
            child: TextField(
              controller: _controllerPassword,
              textAlignVertical: TextAlignVertical.top,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            child: Text("USERAUTHORIZATIONSCREEN_BUTTON_AUTHORIZE_TITLE".tr()),
            onPressed: (){
              CIMUser user = CIMUser(_controllerLogin.text, _controllerPassword.text);
              controller.authorise(user);
              if(controller.isAuthorised())
                controller.currentView.value = CIMViews.main_view;
            },
//              onPressed: () => viewModel.authorizeUser(),
          ),
          TextButton(
            child: Text("CONNECTION_OPTIONS".tr(), style: TextStyle(color: Colors.blue),),
            onPressed: (){
              controller.currentView.value = CIMViews.connection_view;
            },
          )
        ],
      ),
    );
  }
}

class ConnectionView extends StatelessWidget{
  final Controller controller = Get.find();
  TextEditingController _controllerAddress = TextEditingController();
  Icon getConnectionIcon(bool connected)
  {
    return Icon(
        connected ? Icons.check_circle_rounded : Icons.cancel,
        color: connected ? Colors.green :Colors.red,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SERVER_ADDRESS".tr(),
                style: Theme.of(context).textTheme.bodyText1,),
              Container(
                constraints: BoxConstraints.expand(
                    height: Theme.of(context).textTheme.headline6.fontSize * 1.2,
                    width: Theme.of(context).textTheme.bodyText1.fontSize * 15),
                child: TextField(
                  controller: _controllerAddress,
                  textAlignVertical: TextAlignVertical.top,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value){ controller.connectionViewModel.address = value;},
                ),
              ),
              Obx(()=>getConnectionIcon(controller.connectionViewModel.connected.value)),
              ElevatedButton(
                child: Text("TEST_CONNECTION".tr()),
                onPressed: ()=>controller.connectionViewModel.checkConnection(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("OK".tr()),
                  onPressed: ()=> controller.onConnectionChanged(true, _controllerAddress.text),
                ),
              ),
              ElevatedButton(
                child: Text("CANCEL".tr()),
                onPressed: ()=> controller.onConnectionChanged(false, _controllerAddress.text),
              ),
            ]
          ),
        ],
      ),
    );
  }
}

class MainView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.black,
            child: MainMenu(),
          ),
        ),
      ],
    );
  }
}

class MainMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

  }
}