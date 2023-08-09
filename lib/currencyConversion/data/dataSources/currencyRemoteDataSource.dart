// will contain the method that fetches the data from the API

import 'dart:convert';
import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/historicalCurrencyDates.dart';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:http/http.dart' as http;

 abstract class CurrencyRemoteDataSource {
  Future<List<CurrencyModel>> fetchAllCurrencies();
  Future<List<CurrencyModel>> fetchOneCurrencyRate(String baseCurrency, String targetCurrency);
  Future<List<HistoricalDataModel>> fecthHitoricaldata();

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
          throw ServerException();
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
                return currencyRate;
        }
        else{
          throw ServerException();
        }
         
    }
    
      @override
      Future<List<HistoricalDataModel>> fecthHitoricaldata() async{
        Map<String,String> dates = HistoricalCurrencyDates().getAccurateDate();
        String? to = dates['to'];
        String? from = dates['from'];
       
        final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/historical?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=EUR&date_from=${from}T18%3A32%3A53.721Z&date_to=${to}T18%3A32%3A53.722Z"));

        if (response.statusCode == 200){

          final jsonData = jsonDecode(response.body);
          final data = jsonData["data"] as Map<String, dynamic>;

           final historyList = data.keys.map<HistoricalDataModel>((key) {
                return HistoricalDataModel.fromJson( { key: data[key]});}).toList();
                return historyList;
        }
        
        else{
          throw ServerException();
        }

       
  }

}
  




