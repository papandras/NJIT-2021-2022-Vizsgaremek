import 'package:android/controller/user_controller.dart';
import 'package:android/pages/files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/user_binding.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/profil.dart';
import 'pages/register.dart';
import 'pages/settings.dart';

void main() {
  runApp(FiveFile());
}

class FiveFile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 233, 216, 166),
        errorColor: const Color.fromARGB(255, 220, 20, 61),
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: const Color.fromARGB(255, 0, 150, 137)),
      ),
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/home', page: () => const Home(), binding: UserBinding()),
        GetPage(name: '/files', page: () => const Files(), binding: UserBinding()),
        GetPage(name: '/settings', page: () => const Settings(), binding: UserBinding()),
        GetPage(
            name: '/profil', page: () => const Profil(), binding: UserBinding()),
        GetPage(name: '/login', page: () => Login(), binding: UserBinding()),
        GetPage(
            name: '/register', page: () => Register(), binding: UserBinding()),
      ],
    );
  }

}
