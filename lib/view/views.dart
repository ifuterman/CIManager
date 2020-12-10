import 'package:ci_manager/controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'view_model.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'Flutter Demo',
      title: 'title'.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        body: new MainHorizontalLayout(),
      ),
//      home: MyHomePage(title: 'title'.tr()),
    );
  }
}

class MainHorizontalLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
              color: Colors.black,
              child: new MainViewLeftList(),
            ),
            flex: 1),
        Expanded(
          child: MainViewRightScreen(),
          flex: 4,
        )
      ],
    );
  }
}

class MainViewLeftList extends StatefulWidget {
  @override
  createState() => new _MainViewLeftListState();
}

class _MainViewLeftListState extends State<MainViewLeftList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: viewModel.onAuthorizedChanged,
      builder: (context, snapshot) {
        return ListView(
          children: [
            ListTileTheme(
//          selectedColor: Colors.black,
//          selectedTileColor: Colors.white,
              child: Material(
                color: viewModel.isMenuItemSelected(LeftListViewID.ITEM_USER)
                    ? Colors.blue
                    : Colors.black,
                textStyle: TextStyle(color: Colors.white),
                child: ListTile(
                  title: Text(
                    'MAINVIEWLEFTLIST_ITEM_AUTORIZATION_TITLE'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.blue,
                  onTap: () {
                    viewModel.onMenuItemSelected(LeftListViewID.ITEM_USER);
//                setState(() { viewModel.viewRegime = RightViewRegime.REGIME_USER; });
                    setState(() {});
                  },
                  trailing: Icon(
                    Icons.account_circle,
                    color: viewModel.isAuthorized() ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
            ListTileTheme(
              child: Material(
                color:
                    viewModel.isMenuItemSelected(LeftListViewID.ITEM_PATIENTSLIST)
                        ? Colors.blue
                        : Colors.black,
                textStyle: TextStyle(color: Colors.white),
                child: ListTile(
                  title: Text(
                    'MAINVIEWLEFTLIST_ITEM_PATIENTSLIST_TITLE'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.blue,
                  onTap: () {
                    viewModel.onMenuItemSelected(LeftListViewID.ITEM_PATIENTSLIST);
//                setState(() { viewModel.viewRegime = RightViewRegime.REGIME_PATIENT; });
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTileTheme(
              child: Material(
                color: viewModel.isMenuItemSelected(LeftListViewID.ITEM_SCHEDULE)
                    ? Colors.blue
                    : Colors.black,
                textStyle: TextStyle(color: Colors.white),
                child: ListTile(
                  title: Text(
                    'MAINVIEWLEFTLIST_ITEM_SCHEDULE_TITLE'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.blue,
                  onTap: () {
                    viewModel.onMenuItemSelected(LeftListViewID.ITEM_SCHEDULE);
//                setState(() { viewModel.viewRegime = RightViewRegime.REGIME_SCHEDULE; });
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTileTheme(
              child: Material(
                color: viewModel.isMenuItemSelected(LeftListViewID.ITEM_PROTOCOLS)
                    ? Colors.blue
                    : Colors.black,
                textStyle: TextStyle(color: Colors.white),
                child: ListTile(
                  title: Text(
                    'MAINVIEWLEFTLIST_ITEM_PROTOCOLS_TITLE'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.blue,
                  onTap: () {
                    viewModel.onMenuItemSelected(LeftListViewID.ITEM_PROTOCOLS);
//                setState(() { viewModel.viewRegime = RightViewRegime.REGIME_PROTOCOL; });
                    setState(() {});
                  },
                ),
              ),
            ),
            ListTileTheme(
              child: Material(
                color: viewModel.isMenuItemSelected(LeftListViewID.ITEM_SETTINGS)
                    ? Colors.blue
                    : Colors.black,
                textStyle: TextStyle(color: Colors.white),
                child: ListTile(
                  trailing: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    'MAINVIEWLEFTLIST_ITEM_SETTINGS_TITLE'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  hoverColor: Colors.blue,
                  onTap: () {
                    viewModel.onMenuItemSelected(LeftListViewID.ITEM_SETTINGS);
//                setState(() { viewModel.viewRegime = RightViewRegime.REGIME_PROTOCOL; });
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        );
      }
    );
  }

/*  @override
  void setState(VoidCallback fn) => super.setState(fn);*/
}

class MainViewRightScreen extends StatefulWidget {
  @override
  State createState() {
    return MainViewRightScreenState();
  }
}

class MainViewRightScreenState extends State<MainViewRightScreen> {
  TextEditingController _controller_usrename = TextEditingController();
  TextEditingController _controller_password = TextEditingController();

  @override
  void dispose() {
    _controller_password.dispose();
    _controller_usrename.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //child: StreamBuilder<LeftViewItemSelected>(
        child: StreamBuilder<CIM_Event>(
      stream: viewModel.onMenuChanged,
      builder: (context, snapshot){
        if(snapshot.data is LeftViewItemSelected){
          print('MainViewRightScreenState.build');
          return getRightScreenWidget(context, snapshot.data);
        }
        return Container();
      },
    ));
  }

  Widget getRightScreenWidget(
      BuildContext context, LeftViewItemSelected snapshot) {
    LeftViewItemSelected event = snapshot;
    switch (event.id) {
      case LeftListViewID.ITEM_USER:
        {
          if (viewModel.isAuthorized()) return getUserSettingsScreen();
          return getUserAuthorizationScreen();
          break;
        }
      default:
        {
          return Container(color: Colors.grey);
        }
    }
  }

  Widget getUserSettingsScreen() {
    return Container(color: Colors.grey);
  }

  Widget getUserAuthorizationScreen() {
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
                    height:
                        Theme.of(context).textTheme.headline6.fontSize * 1.2,
                    width:
                        Theme.of(context).textTheme.bodyText1.fontSize * 15),
                child: TextField(
                  controller: _controller_usrename,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.authorizationViewModel.userName = value;
                  },
                  onTap: () {
                    _controller_usrename.text =
                        viewModel.authorizationViewModel.userName;
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
                    height:
                    Theme.of(context).textTheme.headline6.fontSize * 1.2,
                    width:
                    Theme.of(context).textTheme.bodyText1.fontSize * 15),
                child: TextField(
                  controller: _controller_password,
                  textAlignVertical: TextAlignVertical.top,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    viewModel.authorizationViewModel.userPassword = value;
                  },
                  onTap: () {
                    _controller_password.text =
                        viewModel.authorizationViewModel.userPassword;
                  },
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                child: Text(
                    "USERAUTHORIZATIONSCREEN_BUTTON_AUTHORIZE_TITLE".tr()
                ),
                onPressed: () => viewModel.authorizeUser(),
              ),
            ],
          ),
        );
  }
}

