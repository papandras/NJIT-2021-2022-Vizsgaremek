import 'package:android/pages/files.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home.dart';
import 'pages/login.dart';
import 'pages/profil.dart';
import 'pages/register.dart';
import 'pages/settings.dart';

void main() {
  runApp(GetMaterialApp(
    home: const Login(),
    theme: ThemeData().copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 233, 216, 166),
      errorColor: const Color.fromARGB(255, 220, 20, 61),
      colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromARGB(255, 0, 150, 137)),
    ),
    getPages: [
      GetPage(name: '/home', page: () => const Home()),
      GetPage(name: '/files', page: () => const Files()),
      GetPage(name: '/settings', page: () => const Settings()),
      GetPage(name: '/profil', page: () => const Profil()),
      GetPage(name: '/login', page: () => const Login()),
      GetPage(name: '/register', page: () => const Register()),
    ],
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginPage();
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterPage();
}
