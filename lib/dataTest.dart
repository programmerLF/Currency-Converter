// will contain the method that fetches the data from the API

import 'package:http/http.dart';

import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'currencyConversion/data/model/currencyModel.dart';



    void main() async{
     
    List<CurrencyModel> currencies = [];
    List<CurrencyModel> currenciesRate = [];
      
   
    currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
    print(currencies);
    print("//////////////////////////////////////////");
    print(CurrencyModel.toJsonList(currencies));
    print("//////////////////////////////////////////");

    //////////////////////////////////////////
    currenciesRate = await CurrencyRemoteDataSourceImp().fetchOneCurrencyRate("EUR", "USD");
    print(currenciesRate);
    print("//////////////////////////////////////////");
    CurrencyLocalDataSourceImp().saveCurrencies(currencies);

    /////////////////////////////////////////
    await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
            
    }

         
    



  
 