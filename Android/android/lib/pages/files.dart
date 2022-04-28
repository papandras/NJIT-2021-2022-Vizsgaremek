import 'package:android/components/DeleteFileButton.dart';
import 'package:android/components/DownloadButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import '../components/menu.dart';

final UserController _controller = Get.find();

class Files extends StatefulWidget {
  const Files({Key? key}) : super(key: key);

  @override
  _FilesState createState() => _FilesState();
}

class _FilesState extends State<Files> {

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
        body: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          backgroundColor: Colors.white,
          strokeWidth: 5.0,
          displacement: 100,
          edgeOffset: 30,
          color: Colors.green,
          onRefresh: () async {
            setState(() {
              _FilesState();
            });
          },
          child: FutureBuilder(
            future: _controller.loadFiles(null),
            builder: (context, files) {
              if (files.connectionState != ConnectionState.done &&
                  _controller.files.length == 0) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Color.fromARGB(255, 0, 150, 137),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Fájlok betöltése folyamatban",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 0, 150, 137),
                                letterSpacing: 2.0,
                                fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                print("files: ${_controller.files.length}");
                return Obx(() => ListView.builder(
                    itemCount: _controller.files.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            DeleteFileButton(
                                name: "${UserController.loggeduser!.name!}-${_controller.files[index].name}.${_controller.files[index].type}"),
                            DownloadButton(name: "${UserController.loggeduser!.name!}-${_controller.files[index].name}.${_controller.files[index].type}"),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            "${_controller.files[index].name!}.${_controller.files[index].type!}",
                            textAlign: TextAlign.left,
                          ),
                          onTap: () {
                          },
                          tileColor: Colors.white70,
                        ),
                      );
                    }));
              }
            },
          ),
        ));
  }
}
