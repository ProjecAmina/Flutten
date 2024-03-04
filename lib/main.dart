import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/database/firebaseAuth/user_service.dart';
import 'package:flutter_job/routes/routes.dart';
import 'package:flutter_job/themes/darkTheme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAJwUl9hFDIaYw7GFhUxCFpNpKwFwhWQ0Q',
          appId: '1:433504848152:android:d44e2d1824b65a930ff66d',
          messagingSenderId:'433504848152',
          projectId: 'flutter-job-5d2e7',
          storageBucket: 'flutter-job-5d2e7.appspot.com',
          ));
  runApp(const ThemeAppMaterial());
}

class ThemeAppMaterial extends StatelessWidget {
  const ThemeAppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthService().currentUser,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: dark,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
