
This app is a demostration of using Healthkit API, consistent with Sprin3 part 2, with have corresponding methods to fetch steps data.

The code were sourced from azarmshap on youtube, https://www.youtube.com/watch?v=ohgrzM9gfvM And it was revised to match the data mapping.

Due to its specialty of the Healthkit API, the implementation can only proceed in app view, instead of playground. 

The file HealthStore contains the major methods like: asking for authorization from the user to get access to healthkit, fetching the steps data in a given date range, and get the today's step count so far whenever the user launches the app. In the current file, the query in the function "fetchStep" will fetch the data of today in a 1 hr frequency, which can be further extend to 1 week, 1 month and futher, and the frequency can be narrowed to 1 min or 1 sec if necessary. It will return the a Healthkit collection which will be further be transformed into a collection of array of Step object, which initialize with date, count and UUID. The function getStep will directly return a double that contains today's step so far whenever this function gets called.

The step is used to represent a customized data period of steps. It has attributes like step count, UUID and date.

The contentview has the major views. It instantiate a health store and call to fetch the data needed and pass the scrape data from the api to visualization. Methods like fetchSteps and getSteps will only be available after the user grant access to healthkit. The contentview have a function updateUIFromStatititcs that will transfer the HKStatisticsCollection to an array of Step object.

The graphView displays the steps info and navigated to contentview.



