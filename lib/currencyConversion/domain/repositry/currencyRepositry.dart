

import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

abstract class CurrencyRepositry  {

// method that will be used to calculate the rate between 2 currencies.
Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency);

// method that will get the list of currencies
Future<List<Currency>> getAllCurrencies(); 
Future<List<HistoricalDataModel>> getHistoricalData();




}