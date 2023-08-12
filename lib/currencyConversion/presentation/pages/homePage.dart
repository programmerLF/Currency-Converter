// ignore_for_file: sized_box_for_whitespace

import 'package:currency_converter/currencyConversion/core/utilities/consts.dart';
import 'package:currency_converter/currencyConversion/domain/entities/currency.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/currencyBloc.dart';
import 'package:currency_converter/currencyConversion/presentation/bloc/historicalDataBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injectionContainer.dart';
import '../../core/utilities/logic/historicalCurrencyDates.dart';
import '../widgets/customizedWidgets.dart';


class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
                    
                if (!state.isListLoaded){
                  context.read<CurrencyBloc>().add(GetAllCurrenciesEvent());
                  return const Center(child: CircularProgressIndicator());
                }

                else{
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
                      Container(
                          height: 60,
                          child: DropdownButton<Currency>(
                            value: state.baseCurrency,
                            onChanged: (currency){
                                context.read<CurrencyBloc>().add(OnChangedBaseCurrencyEvent(baseCurrency: currency!));
                                
                            },
                            items:  state.currencyList!.map<DropdownMenuItem<Currency>>((currency) {
                            return DropdownMenuItem<Currency>(
                              value: currency,
                              child: Container(
                                width: 125,
                                child: ListTile(
                                leading: NetworkImgWidget(flagUrl: currency.currencyFlag,),
                                title: Text(currency.currencyName), ),),);}).toList()),
                        ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: screenWidth - 190,
                        child: TextFormField(
                          validator: (value) {
                            return null;},
                          readOnly: false,
                        onChanged: (baseAmount) {
                            context.read<CurrencyBloc>().add(GetOneCurrencyRateEvent(baseCurrncy: state.baseCurrency!.currencyName, targetCurrency: state.targetCurrency!.currencyName, baseAmount: baseAmount));    
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                          hintText: state.baseAmountStr,
                          border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        
      ),
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
                      Container(
                          height: 60,
                          child: DropdownButton<Currency>(
                            value: state.targetCurrency,
                            onChanged: (targetCurrency){
                                context.read<CurrencyBloc>().add(OnChangedTargetCurrencyEvent(targetCurrency: targetCurrency!));   
                            },
                            items:  state.currencyList!.map<DropdownMenuItem<Currency>>((currency) {
                            return DropdownMenuItem<Currency>(
                              value: currency,
                              child: Container(
                                width: 125,
                                child: ListTile(
                                leading: NetworkImgWidget(flagUrl: currency.currencyFlag,),
                                title: Text(currency.currencyName), ),),);}).toList()),
                        ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: screenWidth - 190,
                          child: TextFormField(
                            readOnly: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                            hintText: state.targetAmountStr,
                            border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)))),
                            
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 30,
                  ),
                ]),
              ),
            );
                }
                });} ),

                    /////////////////////////////////////////////////////////////////
                    ///Historical list of data///
                    
                    const SizedBox(height: 20,),
                     
                    Builder(builder: (context){
                        return BlocBuilder<HistoricalDataBloc, HistoricalDataState>(
                    builder: (context, state) {

                      if (state is HistoricalDataLoading){
                        context.read<HistoricalDataBloc>().add(GetHistoricalDataEvent());
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if (state is LoadedHistoricalDataList){
                        return Column(
                          
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,8,20,8),
                              child: Container(
                                height: 1,
                                color: Colors.black12,
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Historical Data for the past 7 days.", style: $bodyTitleMeduim,textAlign: TextAlign.center,),
                                ),
                              ],
                            ),
                            Container( 
                            height: screenHeight+200,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.historicalData.length,
                              itemBuilder: (context, index){
                                return  Container(
                                  child: Column(
                                    
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                                        child: Align(
                                          alignment: Alignment.center,
                                           child: Text(HistoricalCurrencyDates().dateFormat(state.historicalData[index].date),style: $bodyTitleSmall)),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              width: (screenWidth/3),
                                              child: ListTile(
                                                leading: NetworkImgWidget(flagUrl: state.historicalData[index].currencyFlag,),
                                                title: Text(state.historicalData[index].currencyName),
                                                subtitle: Text(state.historicalData[index].currencyRate.toStringAsFixed(3)),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              width: (screenWidth/3) ,
                                              child: ListTile(
                                                        leading: const NetworkImgWidget(flagUrl:"https://flagcdn.com/40x30/us.png"),
                                                         title: const Text("USD"),
                                                           subtitle: Text(1.toStringAsFixed(3)),
                                                            ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                    ]),);}),),
                          ],
                        );
                      }
                      else{
                        return const Center(child: Text("Something went wrong"));
                      }
                    },);}),
                  ],)
              ),
      );
    
  }
}



