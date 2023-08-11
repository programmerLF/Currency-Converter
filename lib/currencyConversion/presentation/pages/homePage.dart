import 'package:currency_converter/currencyConversion/core/utilities/boxes.dart';
import 'package:currency_converter/currencyConversion/core/utilities/consts.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/currencyBloc.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/historicalDataBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injectionContainer.dart';
import '../widgets/customizedWidgets.dart';


class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController baseAmountController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
    bool readOnly = false;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: MultiBlocProvider(
          providers: [
              BlocProvider<CurrencyBloc>(
              create: (_) => sl<CurrencyBloc>(),
      
            ),
              BlocProvider<HistoricalDataBloc>(
                  create: (_) => sl<HistoricalDataBloc>(),
              ),
          ],
                  child: ListView(children: [

                    Builder(builder: (context){
                      return BlocBuilder<CurrencyBloc,CurrencyState>(
              builder: (context, state){

                if (state is Loading){
                  context.read<CurrencyBloc>().add(GetAllCurrenciesEvent());
                  return const Center(child: CircularProgressIndicator());
                }

                else if (state is LoadedCurrencyList ){
                  Currency currency = state.currencies.first;
                  return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Currency Converter",
                    style: $currencyPageTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "From",
                      style: $bodyTitleSmall,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    children: [
                      CurrenciesDropDownMenu(
                        currenciesList: state.currencies,
                        shownValue: currency,
                         onChanged: (value){
                          currency = value;
                         },
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CurrencyTextField(
                        screenWidth: screenWidth,
                        readOnly: readOnly,
                        baseAmountController: baseAmountController,
                        hintText: "Amount..",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("To",
                        style: $bodyTitleSmall, textAlign: TextAlign.left),
                  ),
                  Row(
                    children: [
                      CurrenciesDropDownMenu(
                        currenciesList: state.currencies,
                        shownValue: state.currencies.last,
                        onChanged: (value){},
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      CurrencyTextField(
                          screenWidth: screenWidth,
                          readOnly: true,
                          baseAmountController: baseAmountController,
                          hintText: "Conveted Amount.."),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {},
                          child: CustomizedButton(screenWidth: screenWidth)),
                    ),
                  )
                ]),
              ),
            );
                }
                else {
                  return const Center(child: Text("Something went wrong"));
                }});} ),

                    /////////////////////////////////////////////////////////////////
                    ///HistoricalDataBloc
                    
                    // Builder(builder: (context){
                    //     return BlocBuilder<HistoricalDataBloc, HistoricalDataState>(
                    // builder: (context, state) {

                    //   if (state is HistoricalDataLoading){
                    //     context.read<HistoricalDataBloc>().add(GetHistoricalDataEvent());
                    //     return const Center(child: CircularProgressIndicator());
                    //   }
                    //   else if (state is LoadedHistoricalDataList){
                    //     return Container(
                    //     height: 300,
                    //     child: ListView.builder(
                    //       itemCount: state.historicalData.length,
                    //       itemBuilder: (context, index){
                    //         return  Container(
                    //           child: Column(
                    //             children: [
                    //               Center(child: Text(state.historicalData[index].date)),
                    //               ListTile(
                    //                 leading: Image.network(state.historicalData[index].currencyFlag),
                    //                 title: Text(state.historicalData[index].currencyName),
                    //                 subtitle: Text(state.historicalData[index].currencyRate.toString()),
                    //               ),
                    //               ListTile(
                    //                 leading: Image.network("https://flagcdn.com/40x30/us.png"),
                    //                 title: Text("USD"),
                    //                 subtitle: Text("1"),
                    //               ),
                    //             ]),);}),);
                    //   }
                    //   else{
                    //     return const Center(child: Text("Something went wrong"));
                    //   }
                    // },);}),
                  ],)
              ),
      );
    
  }
}



