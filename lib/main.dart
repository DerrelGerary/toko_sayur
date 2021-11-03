import 'app_theme_notifier.dart';
import 'screens/grocery_full_app.dart';
import 'themes/app_theme.dart';
import 'themes/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: ChangeNotifierProvider<FxAppThemeNotifier>(
        create: (context) => FxAppThemeNotifier(),
        child: const MyApp(),
      ),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Online',
      theme: FxAppTheme.getThemeFromThemeMode(),
      home: const GroceryFullApp(),
    );
  }
}
