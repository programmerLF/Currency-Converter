

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

abstract class CurrencyRepositry  {

// method that will be used to convert currencies.
Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency);

// method that will get the list of currencies
Future<List<Currency>> getAllCurrencies(); 
Future<List<Currency>> getHistoricalData();




}