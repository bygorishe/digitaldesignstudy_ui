import 'package:digitaldesignstudy_ui/data/services/auth_services.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';
import 'package:digitaldesignstudy_ui/internal/config/app_config.dart';
import 'package:digitaldesignstudy_ui/internal/config/shared_prefs.dart';
import 'package:digitaldesignstudy_ui/internal/config/token_storage.dart';
import 'package:digitaldesignstudy_ui/ui/app_navigator.dart';
import 'package:flutter/material.dart';
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
    var token = await TokenStorage.getAccessToken();
    headers = {"Authorization": "Bearer $token"};
    user = await SharedPrefs.getStoredUser();
  }

  void _logout() async {
    await _authService.logout().then((value) => AppNavigator.toLoader());
  }

  void _refresh() async {
    await _authService.tryGetUser();
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<_ViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: (viewModel.user != null && viewModel.headers != null)
            ? IconButton(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "$baseUrl${viewModel.user!.avatarLink}",
                      headers: viewModel.headers),
                ),
                onPressed: AppNavigator.toInfo,
              )
            : null,
        title: Text(viewModel.user == null ? "Hi" : viewModel.user!.name),
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh), onPressed: viewModel._refresh),
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: viewModel._logout),
        ],
      ),
      body: SafeArea(
        child: Column(children: const [Text("Здесь должны быть посты")]),
      ),
    );
  }

  static create() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _ViewModel(context: context),
      child: const App(),
    );
  }
}
