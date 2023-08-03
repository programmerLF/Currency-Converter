import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetAllCurrenciesUsecase {
    
final CurrencyRepositry _currencyRepositry;
GetAllCurrenciesUsecase(this._currencyRepositry);


Future<List<Currency>> call(){
  return _currencyRepositry.getAllCurrencies();
}
}