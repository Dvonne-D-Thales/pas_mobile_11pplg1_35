import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_35/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
