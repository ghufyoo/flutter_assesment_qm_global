import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qm_global/app/modules/home/controllers/top_up_controller.dart';
import 'package:qm_global/core/dialog/success_dialog.dart';
import 'package:qm_global/core/helper/helper.dart';
import 'package:qm_global/core/theme/text_theme.dart';

class TopUpView extends GetView<TopupController> {
  const TopUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusScopeHelper(context),
      child: Scaffold(
          floatingActionButton: Obx(() => Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: FloatingActionButton.extended(
                    heroTag: controller.usdRate.value,
                    backgroundColor: Colors.amber,
                    onPressed: () async {
                      if (controller.textEditingController.text.isEmpty) {
                        controller.error.value = true;
                      } else {
                        controller.error.value = false;
                        await Get.dialog(SuccessDialog(
                            message:
                                "You have successfully paid ${controller.textEditingController.text}"));
                        Get.back(
                            result: double.tryParse(
                                    controller.textEditingController.text) ??
                                0.00);
                      }
                    },
                    label: Text(
                      "Pay ${controller.textEditingController.text.isEmpty ? "0.0" : controller.textEditingController.text.toString()} USD",
                    )),
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 2,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Obx(() => TextField(
                          controller: controller.textEditingController,
                          style: h2,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          decoration: InputDecoration(
                              suffixText: "gram",
                              label: const Text("Top up"),
                              errorText: controller.error.value
                                  ? "Please type in the value"
                                  : null),
                          onChanged: (_) {
                            controller.error.value = false;
                          },
                          onSubmitted: (_) {
                            controller.textEditingController.text =
                                (double.tryParse(_) ??
                                        0.0 * controller.usdRate.value)
                                    .toString();
                          },
                        )),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
