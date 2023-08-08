// will contain the method that fetched and stores data into local database

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../boxes.dart';
import '../../domain/entities/currency.dart';
import '../model/currencyModel.dart';
import '../model/historicalDataModel.dart';
import 'currencyRemoteDataSource.dart';


abstract class CurrencyLocalDataSource {
 Future<void> initialiseBox();
 Future<void>loadDataIntoDatabase();
 Future<void> initialiseHitsiricalDataBox();
 Future<void> loadHistoricalDataIntoDatabase();

}

class CurrencyLocalDataSourceImp implements CurrencyLocalDataSource{

  
  @override


  @override
  Future<void> initialiseBox() async{
    await Hive.initFlutter();
  Hive.registerAdapter(CurrencyAdapter());
  currencyBox = await Hive.openBox<Currency>('currencyBox');
  }
  
  @override
  Future<void> loadDataIntoDatabase() async{
    final currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  for (var currecny in currencies) {
    currencyBox.put(currecny.currencyName, currecny);
  }
  
  }
  
  @override
  Future<void> initialiseHitsiricalDataBox()async {
  historicalCurrencyBox = await Hive.openBox<Currency>('historicalCurrencyBox');
  }
  
  @override
  Future<void> loadHistoricalDataIntoDatabase() async{
    List<HistoricalDataModel> historicalData = await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
    for (var historical in historicalData) {
      historicalCurrencyBox.put(historical.date, historical);
      print("inserting");
    }
  }

}
