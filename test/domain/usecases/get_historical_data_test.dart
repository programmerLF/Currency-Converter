

import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/historicalDataUsecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrencyRepositry extends  Mock implements CurrencyRepositry{}

void main () {

final MockCurrencyRepositry mockCurrencyRepositry = MockCurrencyRepositry();
final GetHistoricalData useCase = GetHistoricalData(mockCurrencyRepositry);
final List<HistoricalDataModel> testHistoricalData = [

  HistoricalDataModel(  date:"2023-08-04", currencyName: "EUR", currencyRate: 0.911, currencyFlag: "EUFlagUrl",),
  HistoricalDataModel(  date:"2023-08-05",currencyName: "EUR", currencyRate: 0.922, currencyFlag: "EUFlagUrl", ),
];


test("A List of Historical Data should be returned ", () async{

// arrange
 when(() => mockCurrencyRepositry.getHistoricalData()).thenAnswer((_) async => testHistoricalData);

// act
 final result = await useCase();

//assert
expect(result, testHistoricalData);
verify(()=> mockCurrencyRepositry.getHistoricalData());
verifyNoMoreInteractions(mockCurrencyRepositry);

});
}