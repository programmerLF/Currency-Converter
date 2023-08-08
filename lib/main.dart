import 'package:currency_converter/boxes.dart';
import 'package:currency_converter/currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'currencyConversion/data/model/currencyModel.dart';
import 'currencyConversion/domain/entities/currency.dart';
import 'package:google_fonts/google_fonts.dart';




void main() async{
 await CurrencyLocalDataSourceImp().initialiseBox();
// remove this to another file maybe repositry imp
 await CurrencyLocalDataSourceImp().loadDataIntoDatabase();

 await CurrencyLocalDataSourceImp().initialiseHitsiricalDataBox();
 await CurrencyLocalDataSourceImp().loadHistoricalDataIntoDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      title: 'Currency Converter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.teal[25],
      appBar: AppBar(
        backgroundColor: const Color(0Xff007564),
        title: Center(
          child: Text("Currency Converter",  style: GoogleFonts.ibmPlexSansCondensed(
            textStyle: const TextStyle(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600))),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            child: ListView.builder(
              itemCount: currencyBox.length,
              itemBuilder: (context, index){
                CurrencyModel currency = currencyBox.getAt(index);
                return  ListTile(
                  leading: Image.network(currency.currencyFlag),
                  title: Text(currency.currencyName),
                  subtitle: Text(currency.currencyRate.toString()),
                );
              }),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Currency History"),
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: historicalCurrencyBox.length,
              itemBuilder: (context, index){
                HistoricalDataModel currency = historicalCurrencyBox.getAt(index);
                return  Container(
                  child: Column(
                    children: [
                      Center(child: Text(currency.date)),
                      ListTile(
                        leading: Image.network(currency.currencyFlag),
                        title: Text(currency.currencyName),
                        subtitle: Text(currency.currencyRate.toString()),
                      ),
                       ListTile(
                        leading: Image.network("https://flagcdn.com/40x30/us.png"),
                        title: Text("USD"),
                        subtitle: Text("1"),
                      ),
                    ],
                  ),
                );
              }),
          )
        ],
      ),
    );
  }
}




