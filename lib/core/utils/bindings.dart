import 'package:get/get.dart';
import 'package:nannyvanny/ui/screen/base_screen/controller/base_controller.dart';
import 'package:nannyvanny/ui/screen/home_screen/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
