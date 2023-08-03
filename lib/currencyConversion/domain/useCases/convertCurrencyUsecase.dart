

import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

import '../entities/currency.dart';

class ConvertCurrencyUsecase {


  final CurrencyRepositry _currencyRepositry;
  ConvertCurrencyUsecase(this._currencyRepositry);

  Future<void> call(Currency currency) async {
    // calling the methods of currency repositry 
    await _currencyRepositry.convertCurrency(currency);

  }
}