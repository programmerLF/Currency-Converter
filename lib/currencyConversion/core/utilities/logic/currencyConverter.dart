
import '../../errors/exceptions.dart';

class CurrencyConverter{


static convertCurrency(double rate, double targetAmount){
        if (targetAmount >=0){
            return rate * targetAmount;
        }
        else{
          throw NegativeAmountException();
        }

    }

}