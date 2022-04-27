import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';



class DownloadButton extends StatelessWidget {
  String? name;
  DownloadButton({
    Key? key, this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {

        },
        icon: const Icon(Icons.edit));
  }
}