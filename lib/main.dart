import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_demo/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_auth_demo/firebase_options.dart';

import 'theme.dart';
import 'util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Nunito", "Noto Sans Limbu");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
