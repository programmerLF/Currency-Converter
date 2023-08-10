

import 'package:currency_converter/currencyConversion/core/utilities/consts.dart';
import 'package:currency_converter/currencyConversion/data/model/currencyModel.dart';
import 'package:flutter/material.dart';

import '../../data/model/historicalDataModel.dart';
import '../../domain/entities/currency.dart';

class CurrencyPage extends StatelessWidget {
  final List<HistoricalDataModel> historicalData;
  final List<Currency>currenciesList;
  const CurrencyPage({ super.key, required this.currenciesList, required this.historicalData} );
 

  @override
  Widget build(BuildContext context) {
    final TextEditingController baseAmountController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;
     bool readOnly = false;
    return Scaffold(
       backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const SizedBox(height: 10,),
              Text("Currency Converter", style: $currencyPageTitle, textAlign: TextAlign.center,),

              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("From", style: $bodyTitleSmall, textAlign: TextAlign.left,),
              ),
              Row(
                children: [
                  CurrenciesDropDownMenu(currenciesList: currenciesList, shownValue: currenciesList.first,),
                  const SizedBox(width: 15,),
                  CurrencyTextField(screenWidth: screenWidth, readOnly: readOnly, baseAmountController: baseAmountController, hintText: "Amount..",),
                ],
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("To", style: $bodyTitleSmall, textAlign: TextAlign.left),
              ),
              Row(
                children: [
                  CurrenciesDropDownMenu(currenciesList: currenciesList, shownValue: currenciesList.last,),
                  const SizedBox(width: 15,),
                  CurrencyTextField(screenWidth: screenWidth, readOnly: true, baseAmountController: baseAmountController, hintText: "Conveted Amount.."),
                ],
              ),
              const SizedBox(height: 30,),
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
        ),
    );
  }
}

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - 190,
      height: 50,
       decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
        color: Color(0Xff007564),
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      
    ),
    
    child: Center(child: Text("Convert", style: $buttonText,textAlign: TextAlign.center)),
                  );
  }
}

class CurrencyTextField extends StatelessWidget {
  const CurrencyTextField({
    super.key,
    required this.screenWidth,
    required this.readOnly,
    required this.baseAmountController,
    required this.hintText,
  });

  final double screenWidth;
  final bool readOnly;
  final TextEditingController baseAmountController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - 190,
      child: TextFormField(
        validator: (value) {
          return null;},
        readOnly: readOnly,
      controller: baseAmountController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)))),
        
      ),
    );
  }
}

class CurrenciesDropDownMenu extends StatelessWidget {
  const CurrenciesDropDownMenu({
    super.key,
    required this.currenciesList,
    required this.shownValue,
  });

  final List<Currency> currenciesList;
  final Currency shownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: DropdownButton<Currency>(
        value: shownValue,
        onChanged: (value) {
          
        },
        items:  currenciesList.map<DropdownMenuItem<Currency>>((currency) {
        return DropdownMenuItem<Currency>(
          value: currency,
          child: Container(
            width: 125,
            child: ListTile(
            leading: Image.network(currency.currencyFlag, ),
            title: Text(currency.currencyName), ),),);}).toList()),
    );
  }
}