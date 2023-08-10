import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetAllCurrencies {
    
final CurrencyRepositry _currencyRepositry;
GetAllCurrencies(this._currencyRepositry);


Future<List<Currency>> call(){
  return _currencyRepositry.getAllCurrencies();
}
}