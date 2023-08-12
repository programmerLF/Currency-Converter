// will contain the method that fetches the data from the API


// ignore_for_file: avoid_print

// import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:currency_converter/currencyConversion/core/utilities/boxes.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/data/repositry/currencyRepositryImp.dart';

import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';

    void main() async{


  //   List<CurrencyModel> currencies = [];
  //   List<CurrencyModel> currenciesRate = [];
      
  //   currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  //   print(currencies);
  //   print("//////////////////////////////////////////");
  //   print(CurrencyModel.toJsonList(currencies));
  //   print("//////////////////////////////////////////");

  //   //////////////////////////////////////////
  //   currenciesRate = await CurrencyRemoteDataSourceImp().fetchOneCurrencyRate("EUR", "USD");
  //   print(currenciesRate);
  //   print("//////////////////////////////////////////");
    
  // List<HistoricalDataModel> historicalData = [];
  // historicalData = await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
  // print(historicalData);
  // print("//////////////////////////////////////////");
  /////////////////////////////////////////
  // print(HistoricalDataModel.toJsonList(historicalData)); 

  await CurrencyLocalDataSourceImp().initialiseCurrencyBox();
  await CurrencyLocalDataSourceImp().initialiseHitsiricalDataBox();

final currenciesList = await CurrencyLocalDataSourceImp().getLocalCurrencies();
print(currenciesList);
print("//////////////////////////////////////////");

CurrencyRepositryImp repo = CurrencyRepositryImp(currencyLocalDataSource: CurrencyLocalDataSourceImp(), currencyRemoteDataSource: CurrencyRemoteDataSourceImp());
final currenciesList2 = await repo.getAllCurrencies();
print(currenciesList2);
print("2222//////////////////////////////////////////");


final historicalData = await repo.getHistoricalData();
print(historicalData);
print("3333//////////////////////////////////////////");


final currencyRate = await repo.getOneCurrencyRate("USD", "EUR");
print(currencyRate);


final double currencyConverion = CurrencyConverter().convertAmount(rate: currencyRate, baseAmount: "10");
print(currencyConverion);
print(historicalCurrencyBox.isEmpty);



    }

         
    



  
 