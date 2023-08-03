

import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

import '../entities/currency.dart';

class ConvertCurrencyUsecase {


  final CurrencyRepositry _currencyRepositry;
  ConvertCurrencyUsecase(this._currencyRepositry);

  Future<double> call(String baseCurrency, String targetCurrency, double baseAmount) async {
    // calling the methods of currency repositry 
    return await _currencyRepositry.convertCurrency(baseCurrency, targetCurrency, baseAmount);

  }
}