import 'dart:convert';
import 'dart:developer';

import 'package:qm_global/app/data/models/metal_rate.model.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import '../../network/dio_interceptor.network.dart';
import 'metal_rate__repository.dart';

class GoRestRepositoryImpl implements GoRestRepository {
  final apiService = Get.find<NetworkService>();

  @override
  Future getMetalRateData() async {
    // TODO: implement getCompanyMicrosite
    try {
      dio.Response response = await apiService.get(
        "/metals/rates",
      );
      if (response.statusCode == 200) {
        final metalRateData =
            metalsRateModelFromJson(jsonEncode(response.data));

        return metalRateData;
      }
      return null;
    } catch (e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
      throw UnimplementedError(e.toString());
    }
  }
}
