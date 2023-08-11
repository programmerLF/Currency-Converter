part of 'historicalDataBloc.dart';



abstract class HitoricalDataEvent extends Equatable{
  const HitoricalDataEvent();

  @override
  
  List<Object?> get props => [];
}


class GetHistoricalDataEvent extends HitoricalDataEvent{}

class GetOneCurrencyRateEvent extends HitoricalDataEvent{
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