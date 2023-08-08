// exceptions class

class LoadingDataFailureException implements Exception { 
   String errMsg() => 'Failed to Load Data'; 

   // maybe return an error msg for the user manual
}  