import 'package:ecommerce_app/core/services/SettingsServices.dart';
import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => SettingsServices());
  }
}
