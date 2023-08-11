part of 'currencyBloc.dart';




abstract class CurrencyEvent extends Equatable{
  const CurrencyEvent();

  @override
  
  List<Object?> get props => [];
}


class GetAllCurrenciesEvent extends CurrencyEvent{}
class OnChangedBaseCurrency extends CurrencyEvent{
  final Currency currency;
  const OnChangedBaseCurrency({required this.currency});
  
@override
  List<Object?> get props => [currency];


}

class OnChangedTargetCurrency extends CurrencyEvent{
  final Currency targetCurrency;
  const OnChangedTargetCurrency({required this.targetCurrency});
  
@override
  List<Object?> get props => [targetCurrency];
}

class OnChangedBaseAmount extends CurrencyEvent{
  final String baseAmount;
  const OnChangedBaseAmount({required this.baseAmount});
  
@override
  List<Object?> get props => [baseAmount];

}




// class GetHistoricalDataEvent extends CurrencyEvent{}

class GetOneCurrencyRateEvent extends CurrencyEvent{
  final String baseCurrncy;
  final String targetCurrency;
  final double baseAmount;

  const GetOneCurrencyRateEvent({
    required this.baseCurrncy,
    required this.targetCurrency,
    required this.baseAmount,
  });

@override
  List<Object?> get props => [baseCurrncy, targetCurrency, baseAmount];

}