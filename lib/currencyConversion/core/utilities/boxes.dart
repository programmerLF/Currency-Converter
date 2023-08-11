import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:hive/hive.dart';

late Box<Currency>? currencyBox  ;
late Box<HistoricalDataModel>? historicalCurrencyBox;
