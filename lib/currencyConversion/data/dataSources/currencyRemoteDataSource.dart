// will contain the method that fetches the data from the API

import 'dart:convert';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:http/http.dart' as http;
import '../../core/utilities/logic/flagUrlGenerator.dart';

 abstract class CurrencyRemoteDataSource {
Future<List<CurrencyModel>> fetchAllCurrencies();

Future<List<CurrencyModel>> fetchOneCurrencyRate(String baseCurrency, String targetCurrency);
Future<void> fecthHitoricaldata();

}
      
     void main() async{
      List<CurrencyModel> currencies = [];
      List<CurrencyModel> currenciesRate = [];
      
   
  // currencies = await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  // print(currencies);
  //  currenciesRate = await CurrencyRemoteDataSourceImp().fetchOneCurrencyRate("EUR", "USD");
  //  print(currenciesRate);
   await CurrencyRemoteDataSourceImp().fecthHitoricaldata();
}

class CurrencyRemoteDataSourceImp implements CurrencyRemoteDataSource {

  

  @override
  Future<List<CurrencyModel>> fetchAllCurrencies() async{
    
          final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ"));
        // print(response.body);
        if (response.statusCode == 200){

            final  jsonData = jsonDecode(response.body);
            final data = jsonData["data"] as Map<String, dynamic>;

               final currenciesList = data.keys.map<CurrencyModel>((key) {
                return CurrencyModel.fromJson( { "data": {key:data[key]}});}).toList();
                // print(currenciesList);
                return currenciesList;
        }
        else{
          throw Exception();
        }
  
    }
    
    
  

  @override
  Future<List<CurrencyModel>> fetchOneCurrencyRate(String baseCurrency, String targetCurrency) async {
    
   
        final http.Response response = await http.get(Uri.parse(
     "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=$targetCurrency%2C$baseCurrency&base_currency=$baseCurrency"
   ));
     
    if (response.statusCode == 200){

            final  jsonData = jsonDecode(response.body);
            final data = jsonData["data"] as Map<String, dynamic>;

               final currencyRate = data.keys.map<CurrencyModel>((key) {
                return CurrencyModel.fromJson( { "data": {key:data[key]}});}).toList();
                // print(currencyRate);
                return currencyRate;
               
   
        }
        else{
          throw Exception();
        }
         
    }
    
      @override
      Future<void> fecthHitoricaldata() async{
        DateTime now = DateTime.now();
        DateTime date = DateTime(now.year, now.month, now.day);
        DateTime dateTo = date.subtract(const Duration(days: 7));
        DateTime dateFrom = dateTo.subtract(const Duration(days: 7));
        String to = dateTo.toString().substring(0,10);
        String from = dateFrom.toString().substring(0,10);
        print(to);
        print(from);
       
        final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/historical?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=EUR%2CUSD%2CCAD&date_from=${from}T19%3A52%3A25.751Z&date_to=${to}T19%3A52%3A25.751Z"));

        if (response.statusCode == 200){

          final jsonData = jsonDecode(response.body);
          print(jsonData);
          final data = jsonData["data"] as Map<String, Map<String, dynamic>>;
          
          final historicalData = jsonData.keys.map<HistoricalDataModel>((key) {
            
            return HistoricalDataModel.fromJson( { "data": {key:jsonData[key]}});}).toList();

            print(historicalData);
        



        }

        else{
          throw Exception();
        }

       
  }

}
  




