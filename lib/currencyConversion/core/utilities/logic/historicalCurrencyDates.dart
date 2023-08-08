// ignore: file_names
class HistoricalCurrencyDates{

  Map<String,String> getAccurateDate(){
        DateTime now = DateTime.now();
        DateTime today = DateTime(now.year, now.month, now.day);
        DateTime dateTo = today.subtract(const Duration(days: 2));
        DateTime dateFrom = today.subtract(const Duration(days: 7));
        String to = dateTo.toString().substring(0,10);
        String from = dateFrom.toString().substring(0,10);

        return {'from': from,
                'to': to};
}
}