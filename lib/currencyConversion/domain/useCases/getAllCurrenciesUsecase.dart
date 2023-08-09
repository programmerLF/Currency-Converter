import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';

class GetAllCurrenciesUsecase {
    
final CurrencyRepositry _currencyRepositry;
GetAllCurrenciesUsecase(this._currencyRepositry);


Future<void> call(){
  return _currencyRepositry.getAllCurrencies();
}
}