import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import '../components/menu.dart';

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirm = TextEditingController();
final UserController _controller = Get.find();

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '5File',
        ),
        backgroundColor: const Color.fromARGB(255, 0, 150, 137),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: const Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SettingsTitle(),
                const Divider(
                  height: 40.0,
                  color: Colors.white,
                ),
                Email(email: email),
                Password(password: password),
                Confirm(confirm: confirm),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () =>
                        _controller.settings(email.text, password.text, confirm.text),
                    child: const Text(
                      'Mentés',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  const SettingsTitle({
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
            "Beállítások",
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
            'Új jelszó:',
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

class Confirm extends StatelessWidget {
  final TextEditingController? confirm;

  const Confirm({Key? key, required this.confirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
          child: Text(
            'Jelenlegi jelszó megerősítése:',
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
          controller: confirm,
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

class Email extends StatelessWidget {
  final TextEditingController? email;

  const Email({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
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