part of 'currencyBloc.dart';



abstract class CurrencyState extends Equatable{

 const CurrencyState();

 @override
  List<Object?> get props => [];
}


class Loading extends CurrencyState{}

//////////////////////////////////////////////////

class Converted extends CurrencyState{
final double targetAmount;

const Converted({required this.targetAmount});

@override
  List<Object?> get props => [targetAmount];
}

//////////////////////////////////////////////////

class LoadedCurrencyList extends CurrencyState{

final List<Currency> currencies;
const LoadedCurrencyList({required this.currencies});

@override
  List<Object?> get props => [currencies];
}

//////////////////////////////////////////////////

class LoadedHistoricalDataList extends CurrencyState{

final List<HistoricalDataModel> historicalData;
const LoadedHistoricalDataList({ required this.historicalData});

@override
  List<Object?> get props => [historicalData];
}

//////////////////////////////////////////////////

class Error extends CurrencyState{

final String errorMsg;
const Error({ required this.errorMsg});

@override

  List<Object?> get props => [errorMsg];
}
