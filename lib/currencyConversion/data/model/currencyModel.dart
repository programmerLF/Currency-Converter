
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:flutter/foundation.dart';

class CurrencyModel extends Currency{
  
  // constructer of the parent class properities 
  CurrencyModel({required double currencyRate, required String currencyFlag, required String currencyName})

  // cosntructer that uses the properties of the ectented class
  :super(currencyFlag:currencyFlag, currencyRate: currencyRate, currencyName: currencyName);


// will create a currency model object will same attribues of the currecny class
 factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      currencyRate: json['currencyRate'] as double,
      currencyFlag: json['currencyFlag'] as String,
      currencyName: json['currencyName'] as String,
    );
  }

// Factory to json code
  

}