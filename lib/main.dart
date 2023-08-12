import 'package:currency_converter/currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:currency_converter/currencyConversion/presentation/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'injectionContainer.dart' as di;
import 'injectionContainer.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await sl<CurrencyLocalDataSource>().initialiseCurrencyBox();
  await sl<CurrencyLocalDataSource>().initialiseHitsiricalDataBox();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


    
  @override
  Widget build(BuildContext context) {  
    
    return const MaterialApp(
      title: 'Currency Converter App',
      home: CurrencyPage(),
    );
  }
}





