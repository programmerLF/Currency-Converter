

abstract class CurrencyRepositry  {

void convertCurrency(); 

}

// test
class TestCurrencyRepositry extends CurrencyRepositry{
  @override
  void convertCurrency() {
    print("converted");
    
  }
  
}