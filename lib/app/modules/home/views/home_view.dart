import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qm_global/app/routes/app_pages.dart';
import 'package:qm_global/core/helper/helper.dart';
import 'package:qm_global/core/responsive_layout/responsive_widget.dart';

import 'package:get/get.dart';

import '../../../../core/helper/loading_helper.dart';
import '../../../../core/theme/text_theme.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobile: GestureDetector(
          onTap: () => focusScopeHelper(context),
          child: Scaffold(
              body: Obx(() => CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        stretch: true,
                        floating: true,
                        backgroundColor: Colors.amber,
                        title: Container(
                          width: Get.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(' QM Global'),
                              InkWell(
                                onTap: () async {
                                  final data = await Get.toNamed(Routes.TOPUP,
                                      arguments: controller.currencyRateList
                                          .where((p0) => p0.currency == "USD")
                                          .first
                                          .value);
                                  controller.amount.value = data ?? 0.00;
                                },
                                child: Hero(
                                  tag: controller.currencyRateList.isNotEmpty
                                      ? controller.currencyRateList
                                          .where((p0) => p0.currency == "USD")
                                          .first
                                          .value
                                      : "",
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      children: [
                                        Text(
                                          "${controller.amount.value} USD",
                                          style: h3,
                                        ),
                                        const Icon(Icons.add)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        centerTitle: false,
                        onStretchTrigger: () async {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            controller.loadMetalRatesData();
                          });
                          return;
                        },
                        flexibleSpace: FlexibleSpaceBar(
                          stretchModes: const [
                            StretchMode.zoomBackground,
                          ],
                          background: controller.loadingStatus.value ==
                                  LoadingStatus.loading
                              ? Center(child: loadingWidget)
                              : Image.asset(
                                  "assets/images/gold.jpg",
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          child: Center(
                            child: Text(
                              'Scroll up to refresh',
                              style: p6.copyWith(),
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        if (controller.loadingStatus.value ==
                            LoadingStatus.loading) ...[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              loadingWidget,
                            ],
                          )
                        ] else ...[
                          ...controller.currencyRateList.map((element) =>
                              ListTile(
                                leading: controller.countryFlagList
                                        .where((p0) =>
                                            p0.currency.code ==
                                            element.currency)
                                        .isNotEmpty
                                    ? Image.memory(const Base64Decoder()
                                        .convert(controller.countryFlagList
                                            .where((p0) =>
                                                p0.currency.code ==
                                                element.currency)
                                            .first
                                            .flag))
                                    : const Icon(Icons.error_outline_rounded),
                                title: Text(element.currency),
                                trailing:
                                    Text(element.value.toStringAsFixed(3)),
                              ))
                        ]
                      ])),
                    ],
                  ))),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            title: const Text('TABLET'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        desktop: Scaffold(
          appBar: AppBar(
            title: const Text('DESKTOP'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        infinity: Scaffold(
          appBar: AppBar(
            title: const Text('4k'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
