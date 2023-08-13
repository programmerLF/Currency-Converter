Currency converter App is an application that allows the user to select 2 currencies and convert the base amount to the target amount and displays a list of historical currency data for the past 7 days.

The adapted design architecture used to develop the application is clean architecture that separates the logic from presentation. It requires 3 layers: 

1- Domain layer that contains the entity that is the Currency class, the abstract repository class that contains all the abstract methods that needs to be implemented for the features later and the use cases for each method.

The method that needs to be implemented are:

- GetAllCurrencies: this method returns a currency list by checking first if the local database contains data otherwise it fetches the data from the API and stores it into the local data base (currencyBox).

- GetHistoricalData: returns a list of historical data list with the same steps of the previous method but the HistoricalCurrencyBox is used instead for the local database.

- GetOneCurrencyRate: returns a calculated rate by passing 2 currencies to calculateRate() method that gets the rate of each currency from the stored data then returns the rate.

2- Data layer that contains the implementation of the local and remote data sources, repository implementation, and the models that inherit from the entity (CurrencyModel and HistoricalDataModel). 
3- Presentation layer which contains the UI implementation along with the bloc state management. block gets the data from the methods mentioned above and displays it to the user through bloc event and bloc state

Image loader library used for this project is: Cached network image

The local database used in this project is hive, it's a noSQL database good choice for the project due to the simple data that needs to be stored.
