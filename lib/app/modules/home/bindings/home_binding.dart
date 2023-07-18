import 'package:qm_global/app/data/repository/gorest/metal_rate_repository_impl.dart';
import 'package:get/get.dart';
import 'package:qm_global/app/modules/home/controllers/top_up_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(goRestRepositoryImpl: Get.find()),
    );
     Get.lazyPut<TopupController>(
      () => TopupController(),
    );
    Get.lazyPut<GoRestRepositoryImpl>(
      () => GoRestRepositoryImpl(),
    );
  }
}
