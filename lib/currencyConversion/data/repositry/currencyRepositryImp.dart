

import 'package:currency_converter/boxes.dart';
import 'package:currency_converter/currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

import '../../core/errors/exceptions.dart';
import '../../domain/repositry/currencyRepositry.dart';
import '../dataSources/currencyLocalDataSource.dart';

class CurrencyRepositryImp implements CurrencyRepositry {

  
  @override
  Future<void> getAllCurrencies() async {
    // will get the list of currencies for the fetched data
    try{
        if (currencyBox.isEmpty){
      await CurrencyLocalDataSourceImp().initialiseBox();
      await CurrencyLocalDataSourceImp().loadDataIntoDatabase();
    }
    }
    catch(e){
        throw LoadingDataFailureException();
    }
    
  
  }

  @override
  Future<double> getCurrencyrate(String baseCurrency, String targetCurrency ) {
    
    throw UnimplementedError();
  }
  
  @override
  Future<double> convertCurrency(String baseCurrency, String targetCurrency, double baseAmount) {
   
    throw UnimplementedError();
  }
}