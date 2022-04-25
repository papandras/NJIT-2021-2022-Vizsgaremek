import 'dart:convert';

import 'package:android/model/urlprefix.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

TextEditingController fullname = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController password_confirm = TextEditingController();
TextEditingController email = TextEditingController();


class RegisterPage extends State<Register> {
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
              children: const <Widget>[
                RegisterTitle(),
                Divider(
                  height: 40.0,
                  color: Colors.white,
                ),
                UserName(),
                Email(),
                Password(),
                PasswordConfirm(),
                Divider(
                  height: 40.0,
                ),
                RegisterButton(),
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if(password.text != password_confirm.text){
          password_confirm.text == null;
          _showDialog(context, 'A jelszavak nem egyeznek!');
        }
        else if(password.text == '' || password_confirm.text == '' || username.text == '' || email.text == ''){
          _showDialog(context, 'Tölts ki minden mezőt!');
        }
        else if(username.text.length < 3){
          _showDialog(context, 'A felhasználónév minimum 3 karakter!');
        }
        else if(email.text.length < 10){
          _showDialog(context, 'Az email cím minimum 10 karakter!');
        }
        else if(password.text.length < 8){
          _showDialog(context, 'A jelszó minimum 8 karakter!');
        }
        else{
          dynamic userdata = {
            'name': username.text,
            'password': password.text,
            'email': email.text,
          };
          try{
            var response = await Dio().post('${UrlPrefix.prefix}/api/register', data: jsonEncode(userdata));
            Get.toNamed('/login');
          }catch(e){
            print("Hiba: ${e}");
            _showDialog(context, e.toString());
          }
        }
        //Get.toNamed('/login');
      },
      child: const Text(
        'Regisztrálok',
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 0, 150, 137),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
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
            'Email cím:',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1.5,
            ),
          ),
        ),
        TextField(
          maxLength: 50,
          controller: email,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.alternate_email_outlined),
          ),
        ),
      ],
    );
  }
}

class PasswordConfirm extends StatelessWidget {
  const PasswordConfirm({
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
            'Jelszó megerősítése:',
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
          controller: password_confirm,
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
          padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
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

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({
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
              "Regisztráció",
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
