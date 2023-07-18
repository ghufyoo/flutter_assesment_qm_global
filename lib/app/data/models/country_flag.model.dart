// To parse this JSON data, do
//
//     final countryFlagModel = countryFlagModelFromJson(jsonString);

import 'dart:convert';

List<CountryFlagModel> countryFlagModelFromJson(String str) => List<CountryFlagModel>.from(json.decode(str).map((x) => CountryFlagModel.fromJson(x)));

String countryFlagModelToJson(List<CountryFlagModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryFlagModel {
    int id;
    String name;
    String isoAlpha2;
    String isoAlpha3;
    int isoNumeric;
    Currency currency;
    String flag;

    CountryFlagModel({
        required this.id,
        required this.name,
        required this.isoAlpha2,
        required this.isoAlpha3,
        required this.isoNumeric,
        required this.currency,
        required this.flag,
    });

    factory CountryFlagModel.fromJson(Map<String, dynamic> json) => CountryFlagModel(
        id: json["id"],
        name: json["name"],
        isoAlpha2: json["isoAlpha2"],
        isoAlpha3: json["isoAlpha3"],
        isoNumeric: json["isoNumeric"],
        currency: Currency.fromJson(json["currency"]),
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isoAlpha2": isoAlpha2,
        "isoAlpha3": isoAlpha3,
        "isoNumeric": isoNumeric,
        "currency": currency.toJson(),
        "flag": flag,
    };
}

class Currency {
    String code;
    String name;
    dynamic symbol;

    Currency({
        required this.code,
        required this.name,
        required this.symbol,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
    };
}
