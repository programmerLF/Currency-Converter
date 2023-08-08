// will contain the method that fetches the data from the API

// import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'currencyConversion/data/model/currencyModel.dart';
import 'currencyConversion/data/model/historicalDataModel.dart';


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
    
  List<HistoricalDataModel> historicalData = [];
  historicalData = await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
  print(historicalData);
  /////////////////////////////////////////
  print(HistoricalDataModel.toJsonList(historicalData));

    
    
       
    }

         
    



  
 