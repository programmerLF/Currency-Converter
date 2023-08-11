

import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/historicalDataUsecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/historicalDataModel.dart';
import '../../domain/entities/currency.dart';


part 'historicalDataEvent.dart';
part 'historicalDataState.dart';


class HistoricalDataBloc extends Bloc<HitoricalDataEvent, HistoricalDataState>{


final GetHistoricalData getHistoricalData;



HistoricalDataBloc ({
 required this.getHistoricalData,

 

}) : super(HistoricalDataLoading()){
on<GetHistoricalDataEvent>(_getHistoricalData);
}




void _getHistoricalData( GetHistoricalDataEvent event, Emitter<HistoricalDataState> emit)async{

    final historicalData = await getHistoricalData();
    if (historicalData == HistoricalDataModel.historicalDataNotFound){
      emit(const Error( errorMsg: "An Error occured while fetching the list of Historical Data"));
    }
    else{
      emit(LoadedHistoricalDataList(historicalData: historicalData));
    }
}

}