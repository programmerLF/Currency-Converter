

import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetCurrencyRateUsecase{

final CurrencyRepositry _currencyRepositry;
GetCurrencyRateUsecase(this._currencyRepositry);

Future<double> call(String baseCurrency, String targetCurrency){

  return _currencyRepositry.getCurrencyrate(baseCurrency, targetCurrency);

}

}