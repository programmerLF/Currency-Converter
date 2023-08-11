// will contain the method that fetched and stores data into local database

import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyCalculation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../core/utilities/boxes.dart';
import '../../domain/entities/currency.dart';
import '../model/currencyModel.dart';
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
  Future<void> initialiseCurrencyBox() async{
    await Hive.initFlutter();
  Hive.registerAdapter(CurrencyAdapter());
  currencyBox = await Hive.openBox<Currency>('currencyBox');
  }
  
  @override
  Future<void> loadDataIntoDatabase() async{
    final currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  for (var currecny in currencies) {
    currencyBox!.put(currecny.currencyName, currecny);
  }
  }
  
  // change
  @override
  Future<void> initialiseHitsiricalDataBox()async {
  historicalCurrencyBox = await Hive.openBox<HistoricalDataModel>('historicalCurrencyBox');
  }
  
  @override
  Future<void> loadHistoricalDataIntoDatabase() async{
    List<HistoricalDataModel> historicalData = await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
    for (var historical in historicalData) {
      historicalCurrencyBox!.put(historical.date, historical);
      // print("inserting");
    }
  }
  
  @override
  Future<List<Currency>> getLocalCurrencies() async {
    List<Currency> currencies = [];
    try{
      print(currencyBox!.isOpen);
      if (currencyBox!.isNotEmpty){
           for (var element in currencyBox!.values) {
        currencies.add(element);
      }
      return Future.value(currencies);
      }
      else{
        throw LocalDbException();
      }
     
    }
    catch(e){
        print(e);
        throw Exception();
    }
    
  }
  
  @override
  Future<List<HistoricalDataModel>> getLocalHistoricalData() async{
    List<HistoricalDataModel> historicalData = [];
    try{
      
      if(historicalCurrencyBox!.isNotEmpty){
        for (var element in historicalCurrencyBox!.values) {
        historicalData.add(element);
        print("adding");
      }
      return Future.value(historicalData);
      }
      else{
        throw LocalDbException();
      }
    }
    catch(e){
      print(e);
        throw LocalDbException();
    }
  }
  
  @override
  Future<double> getOneCurrencyRate(String baseCurrency, String targetCurrency) async{

    try{
      double baseCurrencyRate = currencyBox!.get(baseCurrency)!.currencyRate.toDouble();
      double targetCurrencyRate = currencyBox!.get(targetCurrency)!.currencyRate.toDouble();
      final rate = await CurrencyCulculation.calculateRate(baseCurrencyRate, targetCurrencyRate);
      return Future.value(rate);
    }

    catch(e){
      print(e);
        throw LocalDbException();
    }
    
  }





}
