

import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetHistoricalData{

final CurrencyRepositry _currencyRepositry;
GetHistoricalData(this._currencyRepositry);

Future<List<HistoricalDataModel>> call(){

  return _currencyRepositry.getHistoricalData();

}

}