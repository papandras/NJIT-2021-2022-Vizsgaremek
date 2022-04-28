import 'dart:io';

import 'package:android/controller/user_controller.dart';
import 'package:android/model/urlprefix.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButton extends StatelessWidget {
  final UserController _controller = Get.find();
  String? name;
  DownloadButton({
    Key? key, this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          print(name);
          var status = await Permission.storage.status;
          if(!status.isGranted){
            await Permission.storage.request();
          }
          Directory? dir = await DownloadsPathProvider.downloadsDirectory;
          await _controller.dio.download('${UrlPrefix.prefix}/api/file/download/${name}', dir!.path + "/${name}");
          print("${name} sikeresen letöltve");
        },
        icon: const Icon(Icons.download, color: Color.fromARGB(255, 0, 150, 137)));
  }
}