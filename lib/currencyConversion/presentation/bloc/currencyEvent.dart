part of 'currencyBloc.dart';




abstract class CurrencyEvent extends Equatable{
  const CurrencyEvent();

  @override
  
  List<Object?> get props => [];
}


class GetAllCurrenciesEvent extends CurrencyEvent{}
class OnChangedBaseCurrencyEvent extends CurrencyEvent{
  final Currency baseCurrency;
  const OnChangedBaseCurrencyEvent({required this.baseCurrency});
  
@override
  List<Object?> get props => [baseCurrency];


}

class OnChangedTargetCurrencyEvent extends CurrencyEvent{
  final Currency targetCurrency;
  const OnChangedTargetCurrencyEvent({required this.targetCurrency});
  
@override
  List<Object?> get props => [targetCurrency];
}

class OnChangedBaseAmountEvent extends CurrencyEvent{
  final String baseAmount;
  const OnChangedBaseAmountEvent({required this.baseAmount});
  
@override
  List<Object?> get props => [baseAmount];

}
class OnChangedTargetAmountEvent extends CurrencyEvent{
  final String targetAmount;
  const OnChangedTargetAmountEvent({required this.targetAmount});
  
@override
  List<Object?> get props => [targetAmount];

}






// class GetHistoricalDataEvent extends CurrencyEvent{}

class GetOneCurrencyRateEvent extends CurrencyEvent{
  final String baseCurrncy;
  final String targetCurrency;
  final String baseAmount;

  const GetOneCurrencyRateEvent({
    required this.baseCurrncy,
    required this.targetCurrency,
    required this.baseAmount,
  });

@override
  List<Object?> get props => [baseCurrncy, targetCurrency, baseAmount];

}