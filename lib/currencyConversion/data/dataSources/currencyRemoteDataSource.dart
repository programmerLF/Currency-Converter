// will contain the method that fetches the data from the API

import 'dart:convert';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:http/http.dart' as http;
import '../../core/utilities/logic/flagUrlGenerator.dart';


         void main() async{
   await fetchAllCurrencies();
   await fetchTwoCurrenciesRate("EUR", "CAD");
}
    

  Future<void> fetchAllCurrencies() async{
    try{
          final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ"));
        // print(response.body);

        if (response.statusCode == 200){
            String data = response.body;

            Map<String, dynamic> decodedData = jsonDecode(data);

            String currencyCode = decodedData["data"].keys.first;
            double currencyRate = decodedData["data"][currencyCode];
            
            print(currencyCode + " " + currencyRate.toString());
            print(decodedData["data"].keys.length);
            
            // CurrencyModel currency1 = CurrencyModel.fromJson(decodedData);
            // List<CurrencyModel> currencies = [];
            // decodedData.forEach((key, value) {
             
            //   currencies.add(CurrencyModel.fromJson({key:value}));
            
            // });

            // print(currencies);
             
              
        }
        
    }
    catch(e){
      print(e);
    }
  }

Future<void> fetchTwoCurrenciesRate(String baseCurrency, String targetCurrency) async{
   final http.Response response = await http.get(Uri.parse(
     "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=$baseCurrency%2C$targetCurrency&base_currency=$baseCurrency"
   ));

   if (response.statusCode == 200){
     String data = response.body;
     Map<String, dynamic> decodedData = jsonDecode(data);
     print(data);
   }
}



  
 