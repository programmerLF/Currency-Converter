// will contain the calculation of the currency conversion 
class CurrencyCulculation{

    double calculateRate(double baseCurrencyRate, double targetCurrencyRate, double baseAmount){

      double targetAmount = (baseAmount * targetCurrencyRate) / baseCurrencyRate;

      return targetAmount;
    }
}