import 'package:currency_converter/currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{

await CurrencyLocalDataSourceImp().initialiseCurrencyBox();
await CurrencyLocalDataSourceImp().initialiseHitsiricalDataBox();

final currencies = await CurrencyLocalDataSourceImp().getLocalCurrencies();
print(currencies);

}