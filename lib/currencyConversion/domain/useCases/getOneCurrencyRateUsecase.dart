

import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';


// ignore: camel_case_types
class getOneCurrencyRateUsecase {


  final CurrencyRepositry _currencyRepositry;
  getOneCurrencyRateUsecase(this._currencyRepositry);

  Future<double> call(String baseCurrency, String targetCurrency) async {
    return await _currencyRepositry.getOneCurrencyRate(baseCurrency, targetCurrency);

  }
}