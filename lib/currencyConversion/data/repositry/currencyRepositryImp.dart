import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

import '../../domain/repositry/currencyRepositry.dart';

class CurrencyRepositryImp implements CurrencyRepositry {
  @override
  Future<void> convertCurrency(Currency currency) {
    // will contain the implemenation of coverting currency 
    // TODO: implement convertCurrency
    throw UnimplementedError();
  }

  @override
  Future<List<Currency>> getCurrenciesList() {
    // will get the list of currencies for the fetched data
    // TODO: implement getCurrenciesList
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrency() {
    // get currency object details
    // TODO: implement getCurrency
    throw UnimplementedError();
  }
}