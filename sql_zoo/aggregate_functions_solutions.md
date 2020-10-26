# Aggregate Functions in SQL

### Using SUM, Count, MAX, DISTINCT and ORDER BY

### Aggregates
The functions SUM, COUNT, MAX and AVG are "aggregates", each may be applied to a numeric attribute resulting in a single row being returned by the query. (These functions are even more useful when used with the GROUP BY clause.)

### DISTINCT
By default the result of a SELECT may contain duplicate rows. We can remove these duplicates using the DISTINCT key word.

### Order by
ORDER BY permits us to see the result of a SELECT in any particular order. We may indicate ASC or DESC for ascending (smallest first, largest last) or descending order.

Q1. The total population and GDP of Europe.
```sql
select sum(population), sum(GDP) from bcc where region like 'Europe'
```

Q2. What are the regions?
```sql
SELECT DISTINCT region FROM bbc
```

Q3. Show the name and population for each country with a population of more than 100000000. Show countries in descending order of population.?
```sql
SELECT name, population
  FROM bbc
  WHERE population > 100000000
  ORDER BY population DESC
```

### SUM and COUNT

World Country Profile: Aggregate functions
This tutorial is about aggregate functions such as COUNT, SUM and AVG. An aggregate function takes many values and delivers just one value. For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.

|name	|continent|	area|	population|	gdp|
|-------|---------|-----|-------------|----|
|Afghanistan|	Asia|	652230|	25500100|	20343000000|
|Albania	|Europe	|28748	|2831741	|12960000000|
|Algeria	|Africa	|2381741|	37100000|	188681000000|
|Andorra	|Europe	|468	|78115	|3712000000|
|Angola	|Africa	|1246700	|20609294	|100990000000|
|...                                                 | 

Q1. Show the total population of the world.
```sql
select sum(population) from world
```
Q2. List all the continents - just once each.
```sql
select continent from world group by continent
```
Q3. Give the total GDP of Africa
```sql
select sum(gdp) from world group by continent having continent like 'Africa';
```
Q4. How many countries have an area of at least 1000000?
```sql
select count(name) from world where continent IN (select continent from world group by continent) and area > 1000000
```

Q5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')?
```sql
select sum(population) from world where name IN ('Estonia', 'Latvia', 'Lithuania')
```

### Using GROUP BY and HAVING

Q6. For each continent show the continent and number of countries.
```sql
select continent, count(name) from world group by continent
```

Q8. List the continents that have a total population of at least 100 million.
```sql
select continent from world group by continent having sum(population) > 100000000
```

### TO-DO Question 7 of Using group by and having

### SUM and COUNT QUIZ

SUM and COUNT QUIZ

bbc
|name|	region|	area|	population|	gdp|
|----|--------|-----|-----------|----|
|Afghanistan	|South Asia|	652225	|26000000|	
|Albania	|Europe	|28728	|3200000	|6656000000|
|Algeria	|Middle East|	2400000	|32900000	|75012000000|
|Andorra	|Europe	|468	|64000	|
|...                            |

Q1. Select the statement that shows the sum of population of all countries in 'Europe'?
```sql
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'
```

Q2. Select the statement that shows the number of countries with population smaller than 150000?
```sql
SELECT COUNT(name) FROM bbc WHERE population < 150000
```

Q5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'?
```sql
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')
```

Q6. Select the statement that shows the medium population density of each region?
```sql
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region
```

Q7. Select the statement that shows the name and population density of the country with the largest population
```sql
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)
```

Q8. Pick the result that would be obtained from the following code:
```
SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000
```

Result:

|Americas|	732240|
|Middle East	|13403102|
|South America|	17740392|
|South Asia|	9437710|
