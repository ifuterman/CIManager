import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';
import 'package:ci_manager/CIMUser.dart';
import 'get_controller.dart';

class CIManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
//    return Scaffold(body: AuthorisationView());
    return Scaffold(
      body: Obx(() => c.authorised.value ? MainView() : AuthorisationView())
    );
  }
}

class AuthorisationView extends StatelessWidget {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final Controller controller = Get.find();
  @override
  Widget build(BuildContext context) {
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
//                  viewModel.authorizationViewModel.userName = value;
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
            },
//              onPressed: () => viewModel.authorizeUser(),
          ),
        ],
      ),
    );
  }
}

class MainView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}