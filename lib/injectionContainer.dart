import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyCalculation.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/currencyConverter.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/flagUrlGenerator.dart';
import 'package:currency_converter/currencyConversion/core/utilities/logic/historicalCurrencyDates.dart';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/data/repositry/currencyRepositryImp.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/domain/repositry/currencyRepositry.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getAllCurrenciesUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/getOneCurrencyRateUsecase.dart';
import 'package:currency_converter/currencyConversion/domain/useCases/historicalDataUsecase.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/currencyBloc.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/historicalDataBloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'currencyConversion/core/utilities/boxes.dart';
import 'currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';


final sl = GetIt.instance;
Future<void> init() async {

// bloc
sl.registerFactory(() => CurrencyBloc(
  getAllCurrencies: sl(),
  // getHistoricalData: sl(),
  getOneCurrencyRate: sl(),
  currencyConverter: sl(),
  ));

  sl.registerFactory(() => HistoricalDataBloc(getHistoricalData: sl()));

// usecases

sl.registerLazySingleton(() => GetAllCurrencies(sl()));
sl.registerLazySingleton(() => GetHistoricalData(sl()));
sl.registerLazySingleton(() => GetOneCurrencyRate(sl()));


// repositry

sl.registerLazySingleton<CurrencyRepositry>(() => CurrencyRepositryImp(currencyLocalDataSource: sl(), currencyRemoteDataSource: sl()) );

// Data sources

sl.registerLazySingleton<CurrencyLocalDataSource>(() => CurrencyLocalDataSourceImp());
sl.registerLazySingleton<CurrencyRemoteDataSource>(() => CurrencyRemoteDataSourceImp());

// core
sl.registerLazySingleton(() => CurrencyConverter());
sl.registerLazySingleton(() => CurrencyCulculation());
sl.registerLazySingleton(() => FlagUrlGenerator());
sl.registerLazySingleton(() => HistoricalCurrencyDates());


// local currency box
// sl.registerLazySingletonAsync<Box<Currency>>(() async{

// await Hive.initFlutter();
// Hive.registerAdapter(CurrencyAdapter());
// currencyBox = await Hive.openBox<Currency>('currencyBox');
// return currencyBox!;
// });

// // local historical data box
// sl.registerLazySingletonAsync<Box<HistoricalDataModel>>(() async{
//   await Hive.initFlutter();

// historicalCurrencyBox = await Hive.openBox<HistoricalDataModel>('historicalCurrencyBox');
// return historicalCurrencyBox!;
// });

}