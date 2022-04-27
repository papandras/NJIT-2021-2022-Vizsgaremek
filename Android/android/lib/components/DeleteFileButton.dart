import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DeleteFileButton extends StatefulWidget {
  int? id;
  bool? subject;
  dynamic deleteFunction;

  DeleteFileButton({Key? key, this.id, this.subject, this.deleteFunction}) : super(key: key);

  @override
  State<DeleteFileButton> createState() => _DeleteFileButtonState();
}

class _DeleteFileButtonState extends State<DeleteFileButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Biztosan törli?",
              middleText: "",
              confirm: ElevatedButton(
                onPressed: () async {
                  widget.deleteFunction(widget.id);
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red)),
                child: const Text("Ok"),
              ),
              cancel: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Mégse"),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
              ));
        },
        icon: const Icon(Icons.delete));
  }
}