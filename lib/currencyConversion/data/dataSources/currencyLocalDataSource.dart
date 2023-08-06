// will contain the method that fetched and stores data into local database
import 'package:hive/hive.dart';

import '../model/currencyModel.dart';


abstract class CurrencyLocalDataSource {
 Future<void> saveCurrencies(List<CurrencyModel> currencies);

}

class CurrencyLocalDataSourceImp implements CurrencyLocalDataSource{

  
  @override
  Future<void> saveCurrencies(List<CurrencyModel> currencies) async{
    
    final collection = await BoxCollection.open(
    'MyFirstFluffyBox', // Name of your database
    {'currencyBox'}, // Names of your boxes
    path: './', // Path where to store your boxes (Only used in Flutter / Dart IO)
  );
   var currencyBox = await Hive.openBox('currencyBox');
   for (var currency in currencies) {
     currencyBox.add(currency);
     
   }
   print(currencyBox);
  }

}


