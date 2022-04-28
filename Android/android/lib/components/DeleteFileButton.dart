import 'package:android/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DeleteFileButton extends StatefulWidget {
  dynamic deleteFunction;
  String? name;

  DeleteFileButton({Key? key, this.name}) : super(key: key);

  @override
  State<DeleteFileButton> createState() => _DeleteFileButtonState();
}

class _DeleteFileButtonState extends State<DeleteFileButton> {
  final UserController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Biztosan törli?",
              middleText: "",
              confirm: ElevatedButton(
                onPressed: () async {
                  _controller.deleteFile(widget.name);
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 220, 20, 61))),
                child: const Text("Ok"),
              ),
              cancel: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Mégse"),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(const Color.fromARGB(255, 53, 177, 74))),
              ));
        },
        icon: const Icon(Icons.delete, color: Color.fromARGB(255, 0, 150, 137)));
  }
}