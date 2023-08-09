// will contain the calculation of the currency conversion 
import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';

class CurrencyCulculation{

    static calculateRate(double baseCurrencyRate, double targetCurrencyRate) async{
      try{
            double rate = (((targetCurrencyRate/baseCurrencyRate) * 1000).round())/1000;
            return Future.value(rate);
        }
      catch(e){
      throw RateCalculationException();
        }    
          }

}