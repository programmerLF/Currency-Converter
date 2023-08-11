
// import 'package:currency_converter/currencyConversion/core/errors/exceptions.dart';
// import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
// import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
// import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
// import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
// import 'package:currency_converter/currencyConversion/domain/useCases/historicalDataUsecase.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/model/historicalDataModel.dart';
// import '../../domain/entities/currency.dart';




// part 'currencyEvent.dart';
// part 'currencyState.dart';


// class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState>{

// final GetAllCurrencies getAllCurrencies;
// // final GetHistoricalData getHistoricalData;
// final GetOneCurrencyRate getOneCurrencyRate;
// final CurrencyConverter currencyConverter;

// CurrencyBloc({
//  required this.getAllCurrencies,
// //  required this.getHistoricalData,
//  required this.getOneCurrencyRate,
//  required this.currencyConverter,

// }) : super(Loading()){
// on<GetAllCurrenciesEvent>(_getAllCurrencies);
// // on<GetHistoricalDataEvent>(_getHistoricalData);
// on<GetOneCurrencyRateEvent>(_getOneCurrencyRate);
// // on<OnChangedCurrency>(_onChangedCurrency);
// }


// void _getAllCurrencies(GetAllCurrenciesEvent event, Emitter<CurrencyState> emit) async{

//     final currencies = await getAllCurrencies();
//     if (currencies == CurrencyModel.emptyCurrencyList){
//         emit(const Error(errorMsg: "An error occured while fetching the list of currencies"));
//     } else{
//       emit(LoadedCurrencyList(currencies: currencies));
//     }

// }



// void _getOneCurrencyRate(GetOneCurrencyRateEvent event, Emitter<CurrencyState> emit)async{
//  final currencyRate = await getOneCurrencyRate(event.baseCurrncy, event.targetCurrency);
//  if ( currencyRate == CurrencyModel.noRateFound){
//     emit(const Error(errorMsg: "An error occured while Calculating the rate"));
//  }
//  else{
//     try{
//       final targetAmount = currencyConverter.convertAmount(rate: currencyRate, baseAmount: event.baseAmount);
//   emit(Converted(targetAmount: targetAmount));
//     }
//     on NegativeAmountException{
//         emit(const Error(errorMsg: "Amount should be Positive"));
//     }
//     on FormatException{
//        emit(const Error(errorMsg: "Invalid format"));
//     }
//  }

// }

// }