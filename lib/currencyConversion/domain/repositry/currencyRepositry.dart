

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

abstract class CurrencyRepositry  {

// method that will be used to convert currencies.
Future<void> convertCurrency(Currency currency);
Future<List<Currency>> getCurrenciesList(); 
Future<String> getCurrency();

}

// test
// class TestCurrencyRepositry extends CurrencyRepositry {
//   @override

//   final CurrencyRepositry _currencyRepositry;
//   TestCurrencyRepositry(this._currencyRepositry);
//   @override

//   Future<void>call(Currency currency)async{
//     _currencyRepositry.convertCurrency(currency);


//   }
  
//   @override
//   Future<void> convertCurrency(Currency currency) {
//     // TODO: implement convertCurrency
//     throw UnimplementedError();
//   }
 
// }