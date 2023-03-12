select * from "CovidPortfolio".public.coviddeaths c 
order by 3,4

--Selecting data for exploration

select location, date, total_cases, new_cases, total_deaths, population
from "CovidPortfolio".public.coviddeaths c 
order by 2, 1

--Looking at total cases vs total deaths

select location, date, total_cases, total_deaths
from "CovidPortfolio".public.coviddeaths c 
where location = 'India'
order by 2, 1

-- Looking at Total Cases vs Population
select location, date, total_cases, total_deaths, (total_deaths::DECIMAL/total_cases) *100 as death_percentage
from "CovidPortfolio".public.coviddeaths c 
order by 2, 1

-- Looking at percentage of people died in India
select location, date, total_cases, total_deaths, (total_deaths::DECIMAL/total_cases) *100 as death_percentage
from "CovidPortfolio".public.coviddeaths c 
where location = 'India'
order by 2, 1


-- Looking at contries with highest infection rate

select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases::DECIMAL/population)) * 100 as infection_rate
from coviddeaths c
group by location, population
order by infection_rate desc



-- Looking at countries with highest death count per population

select location, MAX(total_deaths) as TotalDeathCount
from coviddeaths c 
group by location
order by TotalDeathCount desc


-- let's break it down by continent

select continent, MAX(total_deaths) as TotalDeathCount
from coviddeaths c
group by continent
order by TotalDeathCount desc



-- Global numbers by date

select date, sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths::decimal)/nullif(sum(new_cases),0)) * 100 as DeathPercentage
from coviddeaths c 
where continent <> ''
group by date
order by DeathPercentage desc

-- Global numbers overall

select sum(new_cases) as total_cases, sum(new_deaths) as total_deaths, (sum(new_deaths::decimal)/nullif(sum(new_cases),0)) * 100 as DeathPercentage
from coviddeaths c 
where continent <> ''
order by DeathPercentage desc




select cd.continent, cd."location", cd.date, cd.population, cv.new_vaccinations, 
sum(nullif(cv.new_vaccinations,'')::integer) over (partition by cd.location order by cd.location, cd.date) as RollingVaccinated
from coviddeaths cd 
join covidvaccinations cv 
	on cd.location = cv.location
	and cd.date = cv.date
where cd.continent <> ''
order by 2,3



--Saving the result as a view 

create view RollingVaccinatedPeople as
select cd.continent, cd."location", cd.date, cd.population, cv.new_vaccinations, 
sum(nullif(cv.new_vaccinations,'')::integer) over (partition by cd.location order by cd.location, cd.date) as RollingVaccinated
from coviddeaths cd 
join covidvaccinations cv 
	on cd.location = cv.location
	and cd.date = cv.date
where cd.continent <> ''
order by 2,3

-- retrieving data from view

select * from rollingvaccinatedpeople r 






