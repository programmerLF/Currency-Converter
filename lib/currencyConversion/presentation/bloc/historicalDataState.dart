part of 'historicalDataBloc.dart';



abstract class HistoricalDataState extends Equatable{

 const HistoricalDataState();

 @override
  List<Object?> get props => [];
}


class HistoricalDataLoading extends HistoricalDataState{}

//////////////////////////////////////////////////

class Converted extends HistoricalDataState{
final double targetAmount;

const Converted({required this.targetAmount});

@override
  List<Object?> get props => [targetAmount];
}

//////////////////////////////////////////////////



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
