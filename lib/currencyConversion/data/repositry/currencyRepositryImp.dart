

import 'package:currency_converter/currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import '../../core/errors/exceptions.dart';
import '../../domain/repositry/currencyRepositry.dart';
import '../dataSources/currencyLocalDataSource.dart';
import '../model/currencyModel.dart';

class CurrencyRepositryImp implements CurrencyRepositry {

  final CurrencyLocalDataSource currencyLocalDataSource;
  final CurrencyRemoteDataSource currencyRemoteDataSource;

  CurrencyRepositryImp({required this.currencyLocalDataSource, required this.currencyRemoteDataSource});

  
  @override
  Future<List<Currency>> getAllCurrencies() async {
    List<Currency> currencies = [];
    try{
      currencies = await currencyLocalDataSource.getLocalCurrencies();
      return currencies;
    }on LocalDbException{
        try{
            currencies = await currencyRemoteDataSource.fetchAllCurrencies();
            currencyLocalDataSource.loadDataIntoDatabase();
            return currencies;
        }on ServerException{
          return CurrencyModel.emptyCurrencyList;
        }
    }
  }

  
  
  @override
  Future<List<HistoricalDataModel>> getHistoricalData() async{
   List<HistoricalDataModel > historicalData = [];
   try{
     historicalData = await currencyLocalDataSource.getLocalHistoricalData();
     return historicalData;
     
   }on LocalDbException{
     try{
       historicalData = await currencyRemoteDataSource.fecthHitoricaldata();
       currencyLocalDataSource.loadHistoricalDataIntoDatabase();
       return historicalData;

     } on ServerException{
       return HistoricalDataModel.historicalDataNotFound;
     }
   }
  }
  
  @override
  Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency) async{
    try{
        double rate = await  currencyLocalDataSource.getOneCurrencyRate(baseCurrency, targetCurrency);
        return rate;
    } on RateCalculationException{
      return CurrencyModel.noRateFound;
    }
  }
}