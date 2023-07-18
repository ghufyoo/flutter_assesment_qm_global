import 'package:get/get.dart';
import 'package:qm_global/app/modules/home/views/top_up.view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
      name: _Paths.TOPUP,
      page: () => TopUpView(),
      binding: HomeBinding(),
      
    ),
      ]
    ),
  ];
}
