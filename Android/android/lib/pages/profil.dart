import 'package:android/controller/userController.dart';
import 'package:android/model/urlprefix.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../components/menu.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

bool isChecked = false;

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil>{
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
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 150, 137),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.vlr.gg/img/base/ph/sil.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(50.0)),
                    ),
                  ),
                ),
                Text(
                  "Üdv ${UserController.loggeduser!.name!}!",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 30.0,
                  ),
                ),
                const Divider(
                  height: 40.0,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Felhasználónév: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${UserController.loggeduser!.name!}",
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Email cím: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${UserController.loggeduser!.email!}",
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Regisztáció dátuma: ",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${UserController.loggeduser!.registered!.split('T')[0].replaceAll('-', '.')}.",
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Profil törlése kijelentkezéssel:",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        var dio = Dio();
                        var cookieJar = CookieJar();
                        dio.interceptors.add(CookieManager(cookieJar));
                        if(isChecked){
                          print("delete");
                          var delete = await dio.delete('${UrlPrefix.prefix}/api/user/delete', options: Options(method: "delete" , followRedirects: false, validateStatus: (status){
                            return status! < 500;
                          }, headers: {
                            "Accept": "application/json"
                          }));
                          print(delete.data);
                        }
                        else {
                          print("logout");
                          var logout = await dio.post('${UrlPrefix.prefix}/api/logout', options: Options(method: "post" , followRedirects: false, validateStatus: (status){
                            return status! < 500;
                          }, headers: {
                            "Accept": "application/json"
                          }));
                          print(logout.data);
                        }
                        UserController.loggeduser = null;
                        Get.toNamed('/login');
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.90, 80.0),
                        primary: const Color.fromARGB(255, 0, 150, 137),
                      ),
                      child: const Text(
                        "Kijelentkezés",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
