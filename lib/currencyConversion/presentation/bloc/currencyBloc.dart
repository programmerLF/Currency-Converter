

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

// currency bloc will manage the state of the currency conversion part of the application where it handle the 
//data selected and entered by the user to the convert the base amount to the tagrdet amount 

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
  // events that needs to be triggered 
on<GetAllCurrenciesEvent>(_getAllCurrencies);
on<GetOneCurrencyRateEvent>(_getOneCurrencyRate);
  on<OnChangedBaseCurrencyEvent>(_onChangedBaseCurrency);
  on<OnChangedTargetCurrencyEvent>(_onChangedTargetCurrency);
}

// the the following method gets invoked when user selects the base currency 
void _onChangedBaseCurrency(OnChangedBaseCurrencyEvent event, Emitter<CurrencyState> emit)async {
emit(state.copyWith(baseCurrency: event.baseCurrency));
}

// the the following method gets invoked when user selects the target currency 
void _onChangedTargetCurrency(OnChangedTargetCurrencyEvent event, Emitter<CurrencyState>emit ) async{
emit(state.copyWith(targetCurrency: event.targetCurrency,));
}


// the following method gets imvoked at the when the state of the list is not loaded yet 
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


// the following method gets invoked when the user enters the base amount it autumaticaly calculates the target amount
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