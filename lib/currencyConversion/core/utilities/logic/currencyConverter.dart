
// ignore_for_file: file_names

import '../../errors/exceptions.dart';

class CurrencyConverter{


double convertAmount({required double rate, required String baseAmount}){
  final double amount = double.parse(baseAmount);
        if (amount >=0){
            return rate * amount;
        }
        else{
          throw NegativeAmountException();
        }

    }

}