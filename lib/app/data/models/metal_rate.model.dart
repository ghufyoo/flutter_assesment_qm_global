// To parse this JSON data, do
//
//     final metalsRateModel = metalsRateModelFromJson(jsonString);

import 'dart:convert';

MetalsRateModel metalsRateModelFromJson(String str) => MetalsRateModel.fromJson(json.decode(str));

String metalsRateModelToJson(MetalsRateModel data) => json.encode(data.toJson());

class MetalsRateModel {
    int? code;
    String? message;
    Data? data;

    MetalsRateModel({
         this.code,
         this.message,
         this.data,
    });

    factory MetalsRateModel.fromJson(Map<String, dynamic> json) => MetalsRateModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    String base;
    DateTime timestamp;
    Map<String, double> rates;
    String unit;

    Data({
        required this.base,
        required this.timestamp,
        required this.rates,
        required this.unit,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        base: json["base"],
        timestamp: DateTime.parse(json["timestamp"]),
        rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "timestamp": timestamp.toIso8601String(),
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "unit": unit,
    };
}
