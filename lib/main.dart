import 'package:currency_converter/currencyConversion/core/utilities/boxes.dart';
import 'package:currency_converter/currencyConversion/data/dataSources/currencyLocalDataSource.dart';
import 'package:currency_converter/currencyConversion/data/model/historicalDataModel.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/presentation/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'currencyConversion/data/dataSources/currencyRemoteDataSource.dart';
import 'currencyConversion/data/model/currencyModel.dart';
import 'currencyConversion/data/repositry/currencyRepositryImp.dart';
import 'package:google_fonts/google_fonts.dart';


List<HistoricalDataModel> historicalData=[];
List<Currency>currenciesList=[];

void main() async{
 await CurrencyLocalDataSourceImp().initialiseCurrencyBox();
// remove this to another file maybe repositry imp
 await CurrencyLocalDataSourceImp().initialiseHitsiricalDataBox();


 CurrencyRepositryImp repo = CurrencyRepositryImp(CurrencyLocalDataSourceImp(), CurrencyRemoteDataSourceImp());
 currenciesList = await repo.getAllCurrencies();
 historicalData = await repo.getHistoricalData();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    
    return MaterialApp(
      title: 'Currency Converter App',
      home: CurrencyPage( historicalData: historicalData, currenciesList: currenciesList,),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
  

//   @override
//   Widget build(BuildContext context) {
    
    
//     return Scaffold(
//       backgroundColor: Colors.teal[25],
//       appBar: AppBar(
//         backgroundColor: const Color(0Xff007564),
//         title: Center(
//           child: Text("Currency Converter",  style: GoogleFonts.ibmPlexSansCondensed(
//             textStyle: const TextStyle(
//           color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600))),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 250,
//             child: ListView.builder(
//               itemCount: currenciesList.length,
//               itemBuilder: (context, index){
//                 // CurrencyModel currency = currencyBox.getAt(index);
//                 return  ListTile(
//                   leading: Image.network(currenciesList[index].currencyFlag),
//                   title: Text(currenciesList[index].currencyName),
//                   subtitle: Text(currenciesList[index].currencyRate.toString()),
//                 );
//               }),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text("Currency History"),
//           ),
//           Container(
//             height: 300,
//             child: ListView.builder(
//               itemCount: historicalData.length,
//               itemBuilder: (context, index){
//                 // HistoricalDataModel currency = historicalCurrencyBox.getAt(index);
//                 return  Container(
//                   child: Column(
//                     children: [
//                       Center(child: Text(historicalData[index].date)),
//                       ListTile(
//                         leading: Image.network(historicalData[index].currencyFlag),
//                         title: Text(historicalData[index].currencyName),
//                         subtitle: Text(historicalData[index].currencyRate.toString()),
//                       ),
//                        ListTile(
//                         leading: Image.network("https://flagcdn.com/40x30/us.png"),
//                         title: Text("USD"),
//                         subtitle: Text("1"),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//           )
//         ],
//       ),
//     );
//   }
// }




