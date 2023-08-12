

import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrencyRepositry extends  Mock implements CurrencyRepositry{}

void main () {

final MockCurrencyRepositry mockCurrencyRepositry = MockCurrencyRepositry();
final GetAllCurrencies useCase = GetAllCurrencies(mockCurrencyRepositry);
final List<Currency> testCurrencyList = [

  Currency( currencyName: "USD", currencyRate: 1, currencyFlag: "USFlagUrl",),
  Currency( currencyName: "TRY", currencyRate: 0.8, currencyFlag: "TRFlagUrl", ),
];


test("A List of Currencies should be returned ", () async{

// arrange
 when(() => mockCurrencyRepositry.getAllCurrencies()).thenAnswer((_) async => testCurrencyList);

// act
 final result = await useCase;

//assert
expect(result, testCurrencyList);
verify(()=> mockCurrencyRepositry.getAllCurrencies());
verifyNoMoreInteractions(mockCurrencyRepositry);

});
}