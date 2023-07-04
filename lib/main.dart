import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/add_prodect.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/login_page.dart';
import 'package:store_app/screens/register_page.dart';
import 'package:store_app/screens/update_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProdectPage.id: (context) => const UpdateProdectPage(),
        LoginPage.id: (context) => const LoginPage(),
        Registerpage.id: (context) => const Registerpage(),
        AddProdectService.id: (context) => const AddProdectService(),
      },
      initialRoute: LoginPage.id,
    );
  }
}
