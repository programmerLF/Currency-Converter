

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

import '../../domain/repositry/currencyRepositry.dart';

class CurrencyRepositryImp implements CurrencyRepositry {
  
  @override
  Future<List<Currency>> getAllCurrencies() {
    // will get the list of currencies for the fetched data
    
    throw UnimplementedError();
  }

  @override
  Future<double> getCurrencyrate(String baseCurrency, String targetCurrency ) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<double> convertCurrency(String baseCurrency, String targetCurrency, double baseAmount) {
   
    throw UnimplementedError();
  }
}