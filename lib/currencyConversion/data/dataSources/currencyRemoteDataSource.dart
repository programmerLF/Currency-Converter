// will contain the method that fetches the data from the API

import 'dart:convert';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:http/http.dart' as http;
import '../../core/utilities/logic/flagUrlGenerator.dart';

 abstract class CurrencyRemoteDataSource {
Future<void> fetchAllCurrencies();

Future<CurrencyModel> fetchOneCurrencyRate(String baseCurrency, String targetCurrency);

}
      
     void main() async{
   await CurrencyRemoteDataSourceImp().fetchAllCurrencies();
  //  await CurrencyRemoteDataSourceImp().fetchOneCurrencyRate("CAD", "EUR");
}

class CurrencyRemoteDataSourceImp implements CurrencyRemoteDataSource {

  

  @override
  Future<void> fetchAllCurrencies() async{
    
          final http.Response response = await http.get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ"));
        // print(response.body);

        if (response.statusCode == 200){

            final  jsonData = jsonDecode(response.body);
            final data = jsonData["data"] as Map<String, dynamic>;

               final currenciesList = data.keys.map<CurrencyModel>((key) {

                return CurrencyModel.fromJson( {
                
              "data": {key:data[key]}
 
              });
               }).toList();
              
              print(currenciesList);
   
        }
        else{
          print(response.statusCode);
        }
  
    }
    
    
  

  @override
  Future<CurrencyModel> fetchOneCurrencyRate(String baseCurrency, String targetCurrency) async {
    
    try{
        final http.Response response = await http.get(Uri.parse(
     "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ&currencies=$baseCurrency%2C$targetCurrency&base_currency=$baseCurrency"
   ));

   if (response.statusCode == 200){
     String data = response.body;
     Map<String, dynamic> decodedData = jsonDecode(data);
     print(data);
   }
    }
    catch(e){
      print(e);
    }
    throw UnimplementedError();
  }
  
}



