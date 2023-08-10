// will contain the method that fetches the data from the API

// import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/data/repositry/currencyRepositryImp.dart';

import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'currencyConversion/data/model/currencyModel.dart';
import 'currencyConversion/data/model/historicalDataModel.dart';
import 'currencyConversion/domain/repositry/currencyRepositry.dart';


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

CurrencyRepositryImp repo = CurrencyRepositryImp(CurrencyLocalDataSourceImp(), CurrencyRemoteDataSourceImp());
final currenciesList2 = await repo.getAllCurrencies();
print(currenciesList2);
print("2222//////////////////////////////////////////");


final HistoricalData = await repo.getHistoricalData();
print(HistoricalData);
print("3333//////////////////////////////////////////");


final currencyRate = await repo.getOneCurrencyRate("USD", "EUR");
print(currencyRate);


final double currencyConverion = CurrencyConverter().convertAmount(rate: currencyRate, baseAmount: 10);
print(currencyConverion);

    }

         
    



  
 