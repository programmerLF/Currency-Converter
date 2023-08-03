import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void fetchAPIData() async{
final Response response = await get(Uri.parse(
        "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_CWyF35b55P9PtpANIMD1WMSm2ZD1J8h408R3bwkJ"));
        print(response.body);
        }


  
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    fetchAPIData();
    return Container();
  }
}

