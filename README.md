# currency_converter

Currency converter App is an application that allows the user to select 2 currencies and convert the base amount to the target amount and displays a list of historical currency data for the part 7 days.


The adapted design architecture used to develop the application is clean architecture that separted the logic from presentation.
It requires 3 layers: 
1- Domain layer that contains the entity that is the Currency class, the asbtract repositry class that contains all the abstract methods that needs to be implemented for the features later on and the usecases for each method.

The method that needs to be implemented are: 
- GetAllCurrencies: this method returns a currency list by checking first if the local database contains data otherwise it fetches the data from the api and stores it into the local data base (currencyBox).

- GetHistoricalData: returns a list of histotical data list by with the same steps pf the previous method but the HistoricalCurrencyBox is used instead for the local database.

- GetOneCurrencyRate: returns a calculated rate by passing 2 currencies to calculaterate() method that gets the rate of each currency from the stored data then returns the rate.

2- Data layer that contains the implementation of the local and remote data sources, repositry implmenatation, and the models that inherit from the entity (CurrencyModel and HistoricalDataModel).
3- Presnation layer which contains the UI implemenation along with the bloc state management. 
 block gets the data from the methods mentioned above and displays it to the use through bloc event and bloc state

Image loader library used for this project is: Cached network image


The local database used in this project is hive, its a noSQL database good choice to the project due to the simple data that needs to be stored.

