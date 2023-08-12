part of 'currencyBloc.dart';


// currency contains all the fields needed and stores the of each one of them. copywith method is also implemented to allow us to update specific fields
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




