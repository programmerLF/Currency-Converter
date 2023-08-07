import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:hive/hive.dart';



part 'currency.g.dart';
@HiveType(typeId: 0)

class Currency extends HiveObject{

  // currency class properities
  @HiveField(0)
  final String currencyName;
  @HiveField(1)
  final double currencyRate;
  @HiveField(2)
  final String currencyFlag;
  

  // constructor
  Currency({required this.currencyRate, required this.currencyFlag, required this.currencyName});

}

