part of 'currencyBloc.dart';



class CurrencyState extends Equatable{

 const CurrencyState({
    this.baseCurrency,
    this.targetCurrency,
    this.currencyList,
    this.baseAmountStr = "0.0",
    this.targetAmountStr = "0.0",
    this.isListLoaded = false,
    this.listErrorMessage="Couldn't Fetch List",
    this.listHasError=false,
    this.rateErrorMsg=" Couldn't Fetch Rate",
    this.rateHasError=false,
    
  });
  final Currency? baseCurrency;
  final Currency? targetCurrency;
  final List<Currency>? currencyList;
  final String baseAmountStr;
  final String targetAmountStr;
  final bool isListLoaded;
  final bool listHasError;
  final String listErrorMessage;
  final String rateErrorMsg;
  final bool rateHasError;

  CurrencyState copyWith({
    Currency? baseCurrency,
    Currency? targetCurrency,
    List<Currency>? currencyList,
    String? baseAmountStr,
    String? targetAmountStr,
    bool? isListLoaded,
    String? listErrorMessage,
    bool? listHasError,
    String? rateErrorMsg,
    bool? rateHasError,
  }) =>
      CurrencyState(
          baseCurrency: baseCurrency ?? this.baseCurrency,
          targetCurrency: targetCurrency ?? this.targetCurrency,
          currencyList: currencyList ?? this.currencyList,
          baseAmountStr: baseAmountStr ?? this.baseAmountStr,
          targetAmountStr: targetAmountStr ?? this.targetAmountStr,
          isListLoaded: isListLoaded ?? this.isListLoaded,
          listErrorMessage: listErrorMessage ?? this.listErrorMessage,
          listHasError: listHasError ?? this.listHasError,
          rateErrorMsg: rateErrorMsg?? this.rateErrorMsg,
          rateHasError: rateHasError?? this.rateHasError
          );
          

  @override
  List<Object?> get props => [baseCurrency, targetCurrency, currencyList, baseAmountStr, targetAmountStr, isListLoaded];
}


// class Loading extends CurrencyState{}

// //////////////////////////////////////////////////

// class Converted extends CurrencyState{
// final double targetAmount;

// const Converted({required this.targetAmount});

// @override
//   List<Object?> get props => [targetAmount];
// }

// //////////////////////////////////////////////////


// class Error extends CurrencyState{

// final String errorMsg;
// const Error({ required this.errorMsg});

// @override

//   List<Object?> get props => [errorMsg];
// }



