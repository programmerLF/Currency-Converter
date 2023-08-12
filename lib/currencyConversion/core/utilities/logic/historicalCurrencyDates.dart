
class HistoricalCurrencyDates{

  Map<String,String> getAccurateDate(){
        DateTime now = DateTime.now();
        DateTime today = DateTime(now.year, now.month, now.day);
        DateTime dateTo = today.subtract(const Duration(days: 1));
        DateTime dateFrom = today.subtract(const Duration(days: 7));
        String to = dateTo.toString().substring(0,10);
        String from = dateFrom.toString().substring(0,10);

        return {'from': from,
                'to': to};
}


String dateFormat(String date){
 List<String> dateParts = date.split('-');
 String yearPart = dateParts[0];
 String monthPart = dateParts[1];
 String dayPart = dateParts[2];
 String newdate = "$dayPart-$monthPart-$yearPart";


 return newdate;

}
}