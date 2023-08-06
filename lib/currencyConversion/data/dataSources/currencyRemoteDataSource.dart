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
        DateTime dateTo = date.subtract(const Duration(days: 1));
        DateTime dateFrom = date.subtract(const Duration(days: 9));
        String to = dateTo.toString().substring(0,10);
        String from = dateFrom.toString().substring(0,10);
        // print(from);
        // print(to);
       
        final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/historical?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=EUR%2CUSD&date_from=${from}T13%3A17%3A51.674Z&date_to=${to}T13%3A17%3A51.674Z"));

        if (response.statusCode == 200){

          final jsonData = jsonDecode(response.body);
          final data = jsonData["data"];
          print(data);

           data.keys.map((date) {
             print(date);
              final currenciesList = date.keys.map<CurrencyModel>((key) {
                print(date);
                return CurrencyModel.fromJson( { date: {key:date[key]}});}).toList();

                HistoricalDataModel historyList = HistoricalDataModel(date: date, currenciesRate: currenciesList);
                print(historyList);  
                 return historyList;  
                             
                });

        }

        else{
          throw Exception();
        }

       
  }

}
  




