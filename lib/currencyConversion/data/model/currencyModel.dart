
import 'package:currency_converter/currencyConversion/core/utilities/logic/flagUrlGenerator.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';


class CurrencyModel extends Currency{
  
  // constructer of the parent class properities 
  CurrencyModel({required double currencyRate, required String currencyFlag, required String currencyName})

  // cosntructer that uses the properties of the extented class
  :super(currencyFlag:currencyFlag, currencyRate: currencyRate, currencyName: currencyName);


// will create a currency model object with same attribues of the currecny class
 factory CurrencyModel.fromJson(Map<String, dynamic> json) {
  String code = json["data"].keys.first;
    return CurrencyModel(
      currencyRate: json["data"][code],
      currencyFlag: FlagUrlGenerator.generateFlagUrl(code),
      currencyName: code,
    );
  }

// Factory to json code
  

}