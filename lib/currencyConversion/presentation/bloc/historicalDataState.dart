part of 'historicalDataBloc.dart';


// contains all the states that might occure white getting historical data
abstract class HistoricalDataState extends Equatable{

 const HistoricalDataState();

 @override
  List<Object?> get props => [];
}


class HistoricalDataLoading extends HistoricalDataState{}


//////////////////////////////////////////////////

class LoadedHistoricalDataList extends HistoricalDataState{

final List<HistoricalDataModel> historicalData;
const LoadedHistoricalDataList({ required this.historicalData});

@override
  List<Object?> get props => [historicalData];
}

//////////////////////////////////////////////////

class Error extends HistoricalDataState{

final String errorMsg;
const Error({ required this.errorMsg});

@override

  List<Object?> get props => [errorMsg];
}
