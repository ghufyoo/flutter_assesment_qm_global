// To parse this JSON data, do
//
//     final currencyRateListModel = currencyRateListModelFromJson(jsonString);

import 'dart:convert';

List<CurrencyRateListModel> currencyRateListModelFromJson(String str) => List<CurrencyRateListModel>.from(json.decode(str).map((x) => CurrencyRateListModel.fromJson(x)));

String currencyRateListModelToJson(List<CurrencyRateListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyRateListModel {
    String currency;
    double value;

    CurrencyRateListModel({
        required this.currency,
        required this.value,
    });

    factory CurrencyRateListModel.fromJson(Map<String, dynamic> json) => CurrencyRateListModel(
        currency: json["currency"],
        value: json["value"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency,
        "value": value,
    };
}
