
import '../../errors/exceptions.dart';

class CurrencyConverter{


double convertAmount({required double rate, required double baseAmount}){
        if (baseAmount >=0){
            return rate * baseAmount;
        }
        else{
          throw NegativeAmountException();
        }

    }

}