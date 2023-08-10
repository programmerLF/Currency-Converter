import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyCalculation.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/flagUrlGenerator.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/historicalCurrencyDates.dart';
import 'package:currency_converter/currencyConversion/data/repositry/currencyRepositryImp.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/historicalDataUsecase.dart';
import 'package:get_it/get_it.dart';

import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';


final sl = GetIt.instance;
Future<void> init() async {

// bloc


// usecases

sl.registerLazySingleton(() => GetAllCurrencies(sl()));
sl.registerLazySingleton(() => GetHistoricalData(sl()));
sl.registerLazySingleton(() => GetOneCurrencyRate(sl()));


// repositry

sl.registerLazySingleton<CurrencyRepositry>(() => CurrencyRepositryImp(CurrencyLocalDataSourceImp(), CurrencyRemoteDataSourceImp()));

// Data sources

sl.registerLazySingleton<CurrencyLocalDataSource>(() => CurrencyLocalDataSourceImp());
sl.registerLazySingleton<CurrencyRemoteDataSource>(() => CurrencyRemoteDataSourceImp());

// core
sl.registerLazySingleton(() => CurrencyConverter());
sl.registerLazySingleton(() => CurrencyCulculation());
sl.registerLazySingleton(() => FlagUrlGenerator());
sl.registerLazySingleton(() => HistoricalCurrencyDates());


// external 


}