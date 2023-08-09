

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetHistoricalDataUsecase{

final CurrencyRepositry _currencyRepositry;
GetHistoricalDataUsecase(this._currencyRepositry);

Future<List<Currency>> call(){

  return _currencyRepositry.getHistoricalData();

}

}