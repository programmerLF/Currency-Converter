

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

abstract class CurrencyRepositry  {

// method that will be used to convert currencies.
Future<double> convertCurrency(String baseCurrency, String targetCurrency, double baseAmount);

// method that will get the list of currencies
Future<List<Currency>> getAllCurrencies(); 

// method that will get the rate between 2 curncies
Future<double> getCurrencyrate(String baseCurrency, String targetCurrency);


}