part of 'currencyBloc.dart';



abstract class CurrencyEvent extends Equatable{
  const CurrencyEvent();

  @override
  
  List<Object?> get props => [];
}


class GetAllCurrenciesEvent extends CurrencyEvent{}

class GetHistoricalDataEvent extends CurrencyEvent{}

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