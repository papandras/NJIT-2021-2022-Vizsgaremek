import 'dart:convert';

import 'package:android/model/file_model.dart';
import 'package:android/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/urlprefix.dart';

class UserController extends GetxController {
  static UserModel? loggeduser;
  dynamic _files = Rx<List<FileModel>>([]);

  List<FileModel> get files => _files.value;
  var dio = Dio();
  var cookieJar = CookieJar();

  UserController() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  void login(String username, String password) async {
    dynamic userdata = {
      'name': username,
      'password': password,
    };

    if (username != "" || password != "") {
      if (password.length > 7) {
        try {
          var response = await dio.post('${UrlPrefix.prefix}/api/login',
              data: jsonEncode(userdata));
          dio.interceptors.add(CookieManager(cookieJar));
          print(response.data);
          var user = await dio.get('${UrlPrefix.prefix}/api/user');
          loggeduser = UserModel(
            id: user.data["id"],
            name: user.data["name"].toString(),
            email: user.data["email"].toString(),
            registered: user.data["created_at"].toString(),
            role: user.data["role"].toString(),
            profilpic: user.data["profilpic"].toString(),
          );
          print(loggeduser!.name!);

          Get.toNamed("/home");
        } catch (e) {
          Get.defaultDialog(
              title: "Nem sikerült bejelentkezni",
              content: Text(e.toString().substring(0, 700)));
        }
      } else {
        Get.defaultDialog(
            title: "Nem sikerült bejelentkezni",
            content: const Text("A jelszó minimum 8 karakter!"));
      }
    } else {
      Get.defaultDialog(
          title: "Nem sikerült bejelentkezni",
          content: const Text("Töltsd ki az adatokat!"));
    }
  }

  void register(String fullname, String username, String password,
      String passwordConfirm, String email) async {
    if (password != passwordConfirm) {
      Get.defaultDialog(
          title: "Nem sikerült regisztrálni",
          content: const Text('A jelszavak nem egyeznek!'));
    } else if (password == '' ||
        passwordConfirm == '' ||
        username == '' ||
        email == '') {
      Get.defaultDialog(
          title: "Nem sikerült regisztrálni",
          content: const Text('Tölts ki minden mezőt!'));
    } else if (username.length < 3) {
      Get.defaultDialog(
          title: "Nem sikerült regisztrálni",
          content: const Text('A felhasználónév minimum 3 karakter!'));
    } else if (email.length < 10) {
      Get.defaultDialog(
          title: "Nem sikerült regisztrálni",
          content: const Text('Az email cím minimum 10 karakter!'));
    } else if (password.length < 8) {
      Get.defaultDialog(
          title: "Nem sikerült regisztrálni",
          content: const Text("A jelszó minimum 8 karakter!"));
    } else {
      dynamic userdata = {
        'name': username,
        'password': password,
        'email': email,
      };
      try {
        var response = await dio.post('${UrlPrefix.prefix}/api/register',
            data: jsonEncode(userdata));
        Get.toNamed('/login');
      } catch (e) {
        print("Hiba: $e");
        Get.defaultDialog(
            title: "Nem sikerült regisztrálni", content: Text(e.toString()));
      }
    }
    //Get.toNamed('/login');
  }

  void logout(bool isChecked) async {
    if (isChecked) {
      print("delete");
      var delete = await dio.delete('${UrlPrefix.prefix}/api/user/delete',
          options: Options(
              method: "delete",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json"}));
      print(delete.data);
    } else {
      print("logout");
      var logout = await dio.post('${UrlPrefix.prefix}/api/logout',
          options: Options(
              method: "post",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json"}));
      print(logout.data);
    }
    loggeduser = null;
    Get.toNamed('/login');
  }

  void settings(String? email, String? password, String confirm) async {
    dynamic userdata = {
      'confirm': confirm
    };
    if(password != ""){
      userdata["password"] = password;
    }
    if(email != ""){
      userdata["email"] = email;
    }
    try {
      var settings = await dio.post('${UrlPrefix.prefix}/api/user/settings',
          data: userdata,
          options: Options(
              method: "post",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json"}));
      if (email != "") {
        UserController.loggeduser!.email = email;
      }
      if (settings.statusCode! < 300) {
        Get.defaultDialog(
            title: "Üzenet",
            content: const Text("Beállítások sikeresen elmentve!"));
      }
    }
    catch(e){
      Get.defaultDialog(
          title: "Hiba", content: Text(e.toString()));
    }
  }

  Future<void> loadFiles() async {
    _files = Rx<List<FileModel>>([]);

    try {
      var fileresponse =
          await dio.get('${UrlPrefix.prefix}/api/file/get', options: Options(
              method: "get",
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json"}
          ));
      print(fileresponse.data);
      for (int i = 0; i < fileresponse.data["data"].length; i++) {
        _files.value.add(FileModel.fromJson(fileresponse.data["data"][i]));
        print(fileresponse.data["data"][i]);
      }
      print("response: ${fileresponse}");
    } catch (e) {
      print("Hiba:  $e");
    }
  }

  Future<void> deleteFile(String? name) async {
    var delete = await dio.delete('${UrlPrefix.prefix}/api/file/delete/${name}');
    print("$name sikeresen törölve");
  }
}
