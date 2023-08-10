
import 'package:hive/hive.dart';


// hive generator
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

  // to string method
   @override
  String toString() {
    return "Currency: Code: $currencyName, Rate: $currencyRate, FlagURL: $currencyFlag \n";
  }

}

