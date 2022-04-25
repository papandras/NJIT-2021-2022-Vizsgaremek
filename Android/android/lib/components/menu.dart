import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network("https://i.kek.sh/uIe4L0X7roX.png", width: 240,),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 0, 150, 137),
            ),
            title: const Text('Főoldal'),
            onTap: () {
              Get.toNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.insert_drive_file_rounded,
              color: Color.fromARGB(255, 0, 150, 137),
            ),
            title: const Text('Saját fájlok'),
            onTap: () {
              Get.toNamed('/files');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 0, 150, 137),
            ),
            title: const Text('Beállítások'),
            onTap: () {
              Get.toNamed('/settings');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 0, 150, 137),
            ),
            title: const Text('Profil'),
            onTap: () {
              Get.toNamed('/profil');
            },
          ),
        ],
      ),
    );
  }
}
