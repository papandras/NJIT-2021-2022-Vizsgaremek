import 'package:android/controller/user_controller.dart';
import 'package:get/get.dart';

class UserBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(UserController());
  }

}