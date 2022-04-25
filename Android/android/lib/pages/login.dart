import 'dart:convert';
import 'package:android/controller/userController.dart';
import 'package:android/model/urlprefix.dart';
import 'package:android/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home.dart';
import '../main.dart';

TextEditingController username = new TextEditingController();
TextEditingController password = new TextEditingController();

class LoginPage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('5Five'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 0, 150, 137),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const LoginTitle(),
                const Divider(
                  height: 40.0,
                  color: Colors.white,
                ),
                const UserName(),
                const Password(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: const LoginButton(),
                ),
                const Divider(
                  height: 40.0,
                  color: Colors.green,
                ),
                const RegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          Expanded(
            child: AlertDialog(
              title: Text('Figyelmeztetés'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Bezárás', style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Bejelentkezés",
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed('/register');
      },
      child: const Text(
        'Regisztráció',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 0, 150, 137),
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 15),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        dynamic userdata = {
          'name': username.text,
          'password': password.text,
        };

        if(username.text != "" || password.text != ""){
          if(password.text.length > 7){
            try{
              var response = await Dio().post('${UrlPrefix.prefix}/api/login', data: jsonEncode(userdata));

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            }
            catch(e){
              _showDialog(context, e.toString());
            }
          }
          else{
            _showDialog(context, "A jelszó minimum 8 karakter!");
          }
        }
        else{
          _showDialog(context, "Töltsd ki az adatokat!");
        }

        /*print(UserController.loggeduser.name);
        */
      },
      child: const Text(
        'Bejelentkezés',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 0, 150, 137),
        padding: const EdgeInsets.symmetric(
            horizontal: 30, vertical: 15),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Text(
            'Jelszó:',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.5,
            ),
          ),
        ),
        TextField(
          maxLength: 20,
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.password),
          ),
        ),
      ],
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text(
            'Felhasználó név:',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.5,
            ),
          ),
        ),
        TextField(
          maxLength: 20,
          controller: username,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
