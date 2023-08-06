

import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

import '../../core/utilities/logic/flagUrlGenerator.dart';

class HistoricalDataModel {

final String date ;
final List<CurrencyModel> currenciesRate;
// constructer of the parent class properities 
  HistoricalDataModel({ required this.date, required this.currenciesRate});

  // cosntructer that uses the properties of the extented class
  
  

    
// will create a currency model object with same attribues of the currecny class
//  factory HistoricalDataModel.fromJson(Map<String, dynamic> json) {
//   String date = json.keys.first;
//   String code = json[date];
 

//     return HistoricalDataModel(
//       currencyRate: json[date][code],
//       currencyFlag: FlagUrlGenerator.generateFlagUrl(code),
//       currencyName: code,
//       date: date,
//     );
//   }


  @override
  String toString() {
   
    return "Currency: Date: $date, Code: $currenciesRate \n";
  }

}



