# COVID-19 Data Analysis Project 🦠

The project is build purely to horn the sql skills for data analytics. RAW data is inserted into PostgreSQL and executed the queries, due to the dirty data few convertions and adjustments has to be done. All the operations are in the sql file with comments.


## Data Exploration

First, we explored the data by selecting all columns from the `coviddeaths` table and ordering the data by date and location. We then looked at the total number of cases and deaths in India over time. 

Next, we calculated the percentage of deaths compared to total cases for each country in the dataset. We also calculated the death percentage for India separately. 

We then looked at the countries with the highest infection rates and the countries with the highest death count per population. We broke down the total death count by continent as well.

## Data Visualization

We created a view called `RollingVaccinatedPeople` which calculates the rolling total of vaccinated people by location and date. We then retrieved the data from this view and used it to create visualizations.
- [Visit Tableau Bashboard Here](https://public.tableau.com/app/profile/jayasooryan.tm/viz/CovidDashboard_16794880475510/Dashboard1?publish=yes)


## Conclusion

Overall, this project provided insights into the global impact of COVID-19 on cases, deaths, and vaccinations. The data analysis can be used to inform public health policies and strategies. 


