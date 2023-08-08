

import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:hive/hive.dart';

import '../../core/utilities/logic/flagUrlGenerator.dart';

part 'historicalDataModel.g.dart';
@HiveType(typeId: 1)
class HistoricalDataModel extends Currency{

@HiveField(3)
final String date ;

// constructer of the parent class properities 
  HistoricalDataModel({ required this.date,
  String currencyName ="EUR",
  required double currencyRate,
  String currencyFlag = "https://flagcdn.com/40x30/eu.png",
  })
  // cosntructer that uses the properties of the extented class
  : super(currencyFlag: currencyFlag, currencyName: currencyName, currencyRate: currencyRate);

  
   factory HistoricalDataModel.fromJson(Map<String, dynamic> json) {
    // List<HistoricalDataModel> historicalRates = [];
      String date = json.keys.first;
    return HistoricalDataModel(
      date: date,
      currencyRate: json[date]!.values.first);
  
  }

  static Map toJsonList(List<HistoricalDataModel> historicalData) {
    Map<String, dynamic> historicalDataMap = {};
    for (var history in historicalData) {
      historicalDataMap.putIfAbsent(history.date, () => {history.currencyName: history.currencyRate}); 
    }
    return historicalDataMap;
  }



  @override
  String toString() {
   
    return "Currency: Date: $date, Code: $currencyName, Rate: $currencyRate, FlagURL: $currencyFlag \n";
  }

}



