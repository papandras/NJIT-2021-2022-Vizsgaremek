import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';

class Login extends StatelessWidget {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final UserController _controller = Get.find();

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
                 UserName(username: username),
                 Password(password: password),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () =>
                        _controller.login(username.text, password.text),
                    child: const Text(
                      'Bejelentkezés',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 150, 137),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                    ),
                  ),
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


class LoginTitle extends StatelessWidget {
  const LoginTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
    );
  }
}

class Password extends StatelessWidget {
  final TextEditingController? password;

  const Password({Key? key, required this.password}) : super(key: key);

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
  final TextEditingController? username;

  const UserName({Key? key, required this.username}) : super(key: key);

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
