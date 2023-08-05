

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';

import '../../core/utilities/logic/flagUrlGenerator.dart';

class HistoricalDataModel extends Currency{

final DateTime date ;
// constructer of the parent class properities 
  HistoricalDataModel({required double currencyRate, required String currencyFlag, required String currencyName, required this.date})

  // cosntructer that uses the properties of the extented class
  :super(currencyFlag:currencyFlag, currencyRate: currencyRate, currencyName: currencyName);
  

    
// will create a currency model object with same attribues of the currecny class
 factory HistoricalDataModel.fromJson(Map<String, dynamic> json) {
  DateTime date = json["data"].keys.first;
  String code = json["data"][date];

    return HistoricalDataModel(
      currencyRate: json["data"][date][code],
      currencyFlag: FlagUrlGenerator.generateFlagUrl(code),
      currencyName: code,
      date: date,
    );
  }

}

