import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:qm_global/app/data/models/country_flag.model.dart';
import 'package:qm_global/app/data/models/currency_rate.model.dart';
import 'package:qm_global/app/data/models/metal_rate.model.dart';
import 'package:qm_global/app/data/repository/gorest/metal_rate_repository_impl.dart';
import 'package:get/get.dart';


import '../../../../core/helper/loading_helper.dart';

class HomeController extends GetxController {
  HomeController({required this.goRestRepositoryImpl});
  final GoRestRepositoryImpl goRestRepositoryImpl;
  final metalRate = MetalsRateModel().obs;
  final currencyRateList = <CurrencyRateListModel>[].obs;
  final countryFlagList = <CountryFlagModel>[].obs;
  final loadingStatus = LoadingStatus.loading.obs;
  final amount = 0.00.obs;

  @override
  void onInit() {
    loadMetalRatesData();
    loadCountryFlag();
    super.onInit();
  }

  @override
  void onClose() {}

  loadMetalRatesData() async {
    try {
      loadingStatus.value = LoadingStatus.loading;
      currencyRateList.clear();
      final data = await goRestRepositoryImpl.getMetalRateData();
      metalRate.value = data;
      metalRate.value.data!.rates.map((key, value) {
        currencyRateList
            .add(CurrencyRateListModel(currency: key, value: value));
        return MapEntry(key, value);
      });
      await Future.delayed(const Duration(milliseconds: 500));
      loadingStatus.value = LoadingStatus.success;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      log(e.toString());
    }
  }

  loadCountryFlag() async {
    try {
      final response =
          await rootBundle.loadString('assets/json/country_flag.json');
      final state = (countryFlagModelFromJson(response));
      countryFlagList.assignAll(state);
    } catch (e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
    }
  }

 
}
