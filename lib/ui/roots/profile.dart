import 'package:digitaldesignstudy_ui/data/services/auth_services.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';
import 'package:digitaldesignstudy_ui/internal/config/app_config.dart';
import 'package:digitaldesignstudy_ui/internal/config/shared_prefs.dart';
import 'package:digitaldesignstudy_ui/internal/config/token_storage.dart';
import 'package:digitaldesignstudy_ui/ui/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class _ViewModel extends ChangeNotifier {
  BuildContext context;
  final _authService = AuthService();

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
    // var token = await TokenStorage.getAccessToken();
    // headers = {"Authorization": "Bearer $token"};
    user = await SharedPrefs.getStoredUser();
  }

  void _logout() async {
    await _authService.logout().then((value) => AppNavigator.toLoader());
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dtf = DateFormat("dd.MM.yyyy HH:mm");
    var viewModel = context.watch<_ViewModel>();
    return Scaffold(

        ///backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(viewModel.user == null ? "Hi" : viewModel.user!.name),
          actions: [
            const IconButton(icon: Icon(Icons.edit_note), onPressed: null),
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: viewModel._logout),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: (viewModel.user != null)
                          ? CircleAvatar(
                              //Icon(Icons.camera_alt_outlined),
                              backgroundImage: NetworkImage(
                                "$baseUrl${viewModel.user!.avatarLink}",
                                // headers: viewModel.headers
                              ),
                              radius: 60,
                              foregroundColor: Colors.blue,
                            )
                          : null),
                ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text(("in procces"),
                                            textScaleFactor: 1)))
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
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text(("in procces"),
                                            textScaleFactor: 1)))
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
                                Text("Posts: ", textScaleFactor: 1)
                              ],
                            ),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                TextButton(
                                    onPressed: null,
                                    child: TextButton(
                                        onPressed: null,
                                        child: Text(("in procces"),
                                            textScaleFactor: 1)))
                              ],
                            )
                          ])
                    ]),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        (viewModel.user != null)
                            ? viewModel.user!.fullName ?? " "
                            : "",
                        textScaleFactor: 2,
                      ))
                ],
              ),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("About me: ", textScaleFactor: 1.25),
                      Text(
                          (viewModel.user != null)
                              ? viewModel.user!.about ?? " "
                              : "",
                          textScaleFactor: 1.25)
                    ],
                  )),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text("Birth Date: ", textScaleFactor: 1)
                      ],
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            (viewModel.user != null)
                                ? dtf.format(viewModel.user!.birthDate)
                                : "",
                            textScaleFactor: 1)
                      ],
                    )
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: const [Text("With us since: ", textScaleFactor: 1)],
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        (viewModel.user != null)
                            ? dtf.format(viewModel.user!.registrateDate)
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
      child: const Profile(),
    );
  }
}
