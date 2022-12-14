import 'package:digitaldesignstudy_ui/ui/app_navigator.dart';
import 'package:digitaldesignstudy_ui/ui/roots/loader.dart';
import 'package:flutter/material.dart';
import 'data/services/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: AppNavigator.key,
      onGenerateRoute: (settings) =>
          AppNavigator.onGeneratedRoutes(settings, context),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: LoaderWidget.create(),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
