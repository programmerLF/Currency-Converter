

import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/currency.dart';


part 'currencyEvent.dart';
part 'currencyState.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState>{

final GetAllCurrencies getAllCurrencies;
// final GetHistoricalData getHistoricalData;
final GetOneCurrencyRate getOneCurrencyRate;
final CurrencyConverter currencyConverter;

CurrencyBloc({
 required this.getAllCurrencies,
//  required this.getHistoricalData,
 required this.getOneCurrencyRate,
 required this.currencyConverter,

}) : super(const CurrencyState()){
on<GetAllCurrenciesEvent>(_getAllCurrencies);
// on<GetHistoricalDataEvent>(_getHistoricalData);
on<GetOneCurrencyRateEvent>(_getOneCurrencyRate);
// on<OnChangedCurrency>(_onChangedCurrency);
  on<OnChangedBaseCurrencyEvent>(_onChangedBaseCurrency);
  on<OnChangedTargetCurrencyEvent>(_onChangedTargetCurrency);
}


void _onChangedBaseCurrency(OnChangedBaseCurrencyEvent event, Emitter<CurrencyState> emit)async {
emit(state.copyWith(baseCurrency: event.baseCurrency));
}

void _onChangedTargetCurrency(OnChangedTargetCurrencyEvent event, Emitter<CurrencyState>emit ) async{
emit(state.copyWith(targetCurrency: event.targetCurrency,));
}



void _getAllCurrencies(GetAllCurrenciesEvent event, Emitter<CurrencyState> emit) async{

    final currencies = await getAllCurrencies();
  
    if (currencies == CurrencyModel.emptyCurrencyList){
        emit(state.copyWith(listHasError: true));
    } else{
      emit(state.copyWith(
          isListLoaded: true,
          currencyList: currencies,
          baseCurrency: currencies.first,
          targetCurrency: currencies.last
      ));
    }

}

void _getOneCurrencyRate(GetOneCurrencyRateEvent event, Emitter<CurrencyState> emit)async{
 
 
 final currencyRate = await getOneCurrencyRate(event.baseCurrncy, event.targetCurrency);
 if ( currencyRate == CurrencyModel.noRateFound){
    emit(state.copyWith(rateHasError:true));
 }
 else{
    try{
      final targetAmount = currencyConverter.convertAmount(rate: currencyRate, baseAmount: event.baseAmount);
      final targetAmountStr = targetAmount.toStringAsFixed(3);
  emit(state.copyWith(targetAmountStr: targetAmountStr));
    }
    on NegativeAmountException{
        emit(state.copyWith(rateHasError: true,
        rateErrorMsg: "Invalid Amount"));
    }
    on FormatException{
       emit(state.copyWith(baseAmountStr: "0.0",
       targetAmountStr: "0.0")
       );
    }
 }

}

}