import 'package:currency_converter/boxes.dart';
import 'package:currency_converter/currencyConversion/data/dataSources/currencyLocalDataSource.dart';
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
      body: ListView.builder(
        itemCount: currencyBox.length,
        itemBuilder: (context, index){
          CurrencyModel currency = currencyBox.getAt(index);
          return  ListTile(
            leading: Image.network(currency.currencyFlag),
            title: Text(currency.currencyName),
            subtitle: Text(currency.currencyRate.toString()),
          );
        }),
    );
  }
}




