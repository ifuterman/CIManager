
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:easy_localization/easy_localization.dart';

import 'get_controller.dart';

class CIManagerApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Scaffold(
      body: AuthorisationView()
    );
  }
}

class AuthorisationView extends StatelessWidget
{

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
//                controller: _controller_usrename,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
//                  viewModel.authorizationViewModel.userName = value;
              },
              onTap: () {
                //                _controller_usrename.text =
                //                  viewModel.authorizationViewModel.userName;
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
//                controller: _controller_password,
              textAlignVertical: TextAlignVertical.top,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
//                  viewModel.authorizationViewModel.userPassword = value;
              },
              onTap: () {
//                  _controller_password.text =
//                      viewModel.authorizationViewModel.userPassword;
              },
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            child: Text("USERAUTHORIZATIONSCREEN_BUTTON_AUTHORIZE_TITLE".tr()),
//              onPressed: () => viewModel.authorizeUser(),
          ),
        ],
      ),
    );
  }
}