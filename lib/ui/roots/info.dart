import 'package:digitaldesignstudy_ui/domain/model/user.dart';
import 'package:digitaldesignstudy_ui/internal/config/app_config.dart';
import 'package:digitaldesignstudy_ui/internal/config/shared_prefs.dart';
import 'package:digitaldesignstudy_ui/internal/config/token_storage.dart';
import 'package:digitaldesignstudy_ui/ui/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _ViewModel extends ChangeNotifier {
  BuildContext context;

  _ViewModel({required this.context}) {
    asyncInit();
  }

  User? _user;

  User? get user => _user;

  set user(User? val) {
    _user = val;
    notifyListeners();
  }

  Map<String, String>? headers;

  void asyncInit() async {
    var token = await TokenStorage.getAccessToken();
    headers = {"Authorization": "Bearer $token"};
    user = await SharedPrefs.getStoredUser();
  }
}

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<_ViewModel>();
    return Scaffold(

        ///backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(viewModel.user == null ? "Hi" : viewModel.user!.name),
          actions: const [
            IconButton(
                icon: Icon(Icons.exit_to_app), onPressed: AppNavigator.toApp),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(children: [
              Row(children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child:
                          (viewModel.user != null && viewModel.headers != null)
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "$baseUrl${viewModel.user!.avatarLink}",
                                      headers: viewModel.headers),
                                  radius: 60,
                                  foregroundColor: Colors.blue,
                                )
                              : null),
                  Text(
                    (viewModel.user != null && viewModel.headers != null)
                        ? viewModel.user!.name
                        : "",
                    textScaleFactor: 2,
                  ),
                ]),
                Column(children: [
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Fullname: ", textScaleFactor: 1)
                          ],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                (viewModel.user != null &&
                                        viewModel.headers != null)
                                    ? viewModel.user!.fullName
                                    : "",
                                textScaleFactor: 1)
                          ],
                        )
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("BirthDate: ", textScaleFactor: 1)
                          ],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                (viewModel.user != null &&
                                        viewModel.headers != null)
                                    ? viewModel.user!.birthDate.substring(0, 10)
                                    : "",
                                textScaleFactor: 1)
                          ],
                        )
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Followers: ", textScaleFactor: 1)
                          ],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            TextButton(
                                onPressed: null,
                                child: Text(("in procces"), textScaleFactor: 1))
                          ],
                        )
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Subscridtions: ", textScaleFactor: 1)
                          ],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            TextButton(
                                onPressed: null,
                                child: Text(("in procces"), textScaleFactor: 1))
                          ],
                        )
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: const [Text("Posts: ", textScaleFactor: 1)],
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            TextButton(
                                onPressed: null,
                                child: Text(("in procces"), textScaleFactor: 1))
                          ],
                        )
                      ])
                ]),
              ]),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("About:", textScaleFactor: 1.25),
                      Text(
                          (viewModel.user != null && viewModel.headers != null)
                              ? viewModel.user!.about
                              : "",
                          textScaleFactor: 1.25)
                    ],
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Text("RegistrateDate", textScaleFactor: 1)],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        (viewModel.user != null && viewModel.headers != null)
                            ? viewModel.user!.registrateDate.substring(0, 10)
                            : "",
                        textScaleFactor: 1)
                  ],
                )
              ])
            ]),
          ),
        )));
  }

  static create() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _ViewModel(context: context),
      child: const Info(),
    );
  }
}
