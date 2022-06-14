import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_storage/providers/theme_provider.dart';
import 'package:local_storage/themes/themes.dart';
import 'package:provider/provider.dart';
import "package:local_storage/shared_preferences/shared_preferences.dart"
    show SPreferences;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPreferences.init();

  runApp(const AppProvider());
}

class AppProvider extends StatelessWidget {
  const AppProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const App(),
      );
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode.getCurrentTheme
          ? CustomTheme.darkTheme
          : CustomTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          title: const Text("preferences"),
          actions: <Widget>[
            CupertinoSwitch(
                
                value: themeMode.getCurrentTheme,
                onChanged: (value) {
                  themeMode.setCurrentTheme = value;
                })
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(35, 38, 53, 1),
          ),
          width: double.infinity,
        ),
      ),
    );
  }
}
