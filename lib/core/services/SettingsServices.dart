import 'package:ecommerce_app/core/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class SettingsServices extends GetxService {
  Future<SettingsServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    return this;
  }
}
