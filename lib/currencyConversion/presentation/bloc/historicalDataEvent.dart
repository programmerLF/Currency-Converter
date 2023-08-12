part of 'historicalDataBloc.dart';



abstract class HitoricalDataEvent extends Equatable{
  const HitoricalDataEvent();

  @override
  
  List<Object?> get props => [];
}


class GetHistoricalDataEvent extends HitoricalDataEvent{}



