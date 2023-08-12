
import 'package:flutter/material.dart';

import '../../core/utilities/consts.dart';
import '../../domain/entities/currency.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
          offset: const Offset(0, 3),
        ),
      ],
        color: Color(0Xff007564),
      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      
    ),
    
    child: Center(child: Text("Convert", style: $buttonText,textAlign: TextAlign.center)),
                  );
  }
}



//////////////////////////////////////////
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
    required this.onChanged
    
  });

  final List<Currency> currenciesList;
  final Currency shownValue;
  final Function? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: DropdownButton<Currency>(
        value: shownValue,
        onChanged: (value){
            print(value!.currencyRate.toString());
        },
        items:  currenciesList.map<DropdownMenuItem<Currency>>((currency) {
        return DropdownMenuItem<Currency>(
          value: currency,
          child: Container(
            width: 125,
            child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: currency.currencyFlag,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(currency.currencyName), ),),);}).toList()),
    );
  }
}


class NetworkImgWidget extends StatelessWidget {
  const NetworkImgWidget({
    super.key, required this.flagUrl,
  });

  final String flagUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: flagUrl,
      placeholder: (context, url) => CircularProgressIndicator(
        color: $greenColor,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}

