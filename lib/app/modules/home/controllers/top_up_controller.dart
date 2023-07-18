import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TopupController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  final error = false.obs;
  final usdRate = 0.00.obs;

  @override
  void onInit() {
    usdRate.value = Get.arguments ?? "";

    super.onInit();
  }

  @override
  void onClose() {}
}
