

import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrencyRepositry extends Mock implements CurrencyRepositry{}

void main(){
 MockCurrencyRepositry mockCurrencyRepositry = MockCurrencyRepositry();
 GetOneCurrencyRate usecase = GetOneCurrencyRate(mockCurrencyRepositry);


 double currencyRateTest = 0.8;
 String baseCurrencyTest = "TRY";
 String targetCurrencyTest = "USD";

//arrange
test("Currency Rate should be returned", () async {
when (() => mockCurrencyRepositry.getOneCurrencyRate(baseCurrencyTest, targetCurrencyTest)).thenAnswer((_) => Future.value(currencyRateTest));

//act
final result = await usecase(baseCurrencyTest, targetCurrencyTest);

//assert
expect(result, currencyRateTest);
verify(()=> mockCurrencyRepositry.getOneCurrencyRate(baseCurrencyTest, targetCurrencyTest));
verifyNoMoreInteractions(mockCurrencyRepositry);

});



}

