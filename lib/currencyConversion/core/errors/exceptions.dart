// exceptions class

class ServerException implements Exception { 
   String errMsg() => 'Failed to Load Data from API'; 

   
}  
class LocalDbException implements Exception { 
   String errMsg() => 'Failed to Load Data from Local Database'; 
}  

class RateCalculationException implements Exception { 
   String errMsg() => 'Failed to calculate the rate of the currency'; 
}  

class NegativeAmountException implements Exception { 
   String errMsg() => 'incorrect target amount'; 
}

