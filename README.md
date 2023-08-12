# currency_converter

Currency converter App is an application that allows the user to select 2 currencies and convert the base amount to the target amount and displays a list of historical currency data for the part 7 days.


The adapted design architecture used to develop the application is clean architecture that separted the logic from presentation.
It requires 3 layers: 
1- Domain layer that contains the entity that is the Currency class, the asbtract repositry class that contains all the absraxts methods that needs to be implemented for the features later on and the usecases for each method.
2- Data layer that contains the implementation of the local and remote data sources, repositry implmenatation, and the models that inherit from the entity.
3- Presnation layer which contains the UI implemenation along with the bloc state management. 

Image loader library used for this project is:  Cached network image


The local database used in this project is hive, its a noSQL database good choice to the project due to the simple data that needs to be stored.

