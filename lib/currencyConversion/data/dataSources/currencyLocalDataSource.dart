// will contain the method that fetched and stores data into local database

import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyCalculation.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/utilities/boxes.dart';
import '../../domain/entities/currency.dart';
import '../model/historicalDataModel.dart';
import 'currencyRemoteDataSource.dart';


abstract class CurrencyLocalDataSource {
 Future<void> initialiseCurrencyBox();
 Future<void>loadDataIntoDatabase();
 Future<void> initialiseHitsiricalDataBox();
 Future<void> loadHistoricalDataIntoDatabase();
 Future<List<Currency>> getLocalCurrencies();
 Future<List<HistoricalDataModel>> getLocalHistoricalData();
 Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency);

}

class CurrencyLocalDataSourceImp implements CurrencyLocalDataSource{


  @override

  // the following method inistialises the currencybox 
  Future<void> initialiseCurrencyBox() async{
    await Hive.initFlutter();
  Hive.registerAdapter(CurrencyAdapter());
  currencyBox = await Hive.openBox<Currency>('currencyBox');
  }
  
  // loads data into currencybox after fetching it from the api
  @override
  Future<void> loadDataIntoDatabase() async{
    final currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  for (var currecny in currencies) {
    currencyBox.put(currecny.currencyName, currecny);
  }
  }
  
  // the following method inistialises the historicalDatabBox
  @override
  Future<void> initialiseHitsiricalDataBox()async {
  Hive.registerAdapter(HistoricalDataModelAdapter());
  historicalCurrencyBox = await Hive.openBox<HistoricalDataModel>('historicalCurrencyBox');
 
  }
  
  // loads data into historticalDataBox after fetching it from the api
  @override
  Future<void> loadHistoricalDataIntoDatabase() async{
    List<HistoricalDataModel> historicalData = await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
    for (var historical in historicalData) {
      historicalCurrencyBox.put(historical.date, historical);
    }
  }
  
  // gets the currency list from the local database
  @override
  Future<List<Currency>> getLocalCurrencies() async {
    List<Currency> currencies = [];
    
      if (currencyBox.isNotEmpty){
           for (var element in currencyBox.values) {
        currencies.add(element);
      }
      return Future.value(currencies);
      }
      else{
        throw LocalDbException();
      }
     
    }
    
    
  
  // gets the historical data list from the local database
  @override
  Future<List<HistoricalDataModel>> getLocalHistoricalData() async{
    List<HistoricalDataModel> historicalData = [];
    
      if(historicalCurrencyBox.isNotEmpty){
        for (var element in historicalCurrencyBox.values) {
        historicalData.add(element);
      }
      return Future.value(historicalData);
      }
      else{
        throw LocalDbException();
      }
    }
  
  // gets the calculated rate 
  @override
  Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency) async{


      if (currencyBox.isNotEmpty){
      double baseCurrencyRate = currencyBox.get(baseCurrency)!.currencyRate.toDouble();
      double targetCurrencyRate = currencyBox.get(targetCurrency)!.currencyRate.toDouble();
      final rate = await CurrencyCulculation.calculateRate(baseCurrencyRate: baseCurrencyRate, targetCurrencyRate: targetCurrencyRate);
      return Future.value(rate);

      }
      else{
        throw LocalDbException();
      }
    
  }





}
