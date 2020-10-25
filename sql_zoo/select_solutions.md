# SQLZOO EXERCISE SOLUTIONS

### SELECT BASICS

world table
```
name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Albania	Europe	28748	2831741	12960000000
Algeria	Africa	2381741	37100000	188681000000
Andorra	Europe	468	78115	3712000000
Angola	Africa	1246700	20609294	100990000000
....
```

Q1. Modify it to show the population of Germany?
```
SELECT population FROM world
  WHERE name = 'France'
```
Q2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'?
```
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');
```
Q3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
```
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
```

### SQL Quiz

Some questions concerning basic SQL statements

name	region	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
...

Q1. Select the code which produces this table
name	population
Bahrain	1234571
Swaziland	1220000
Timor-Leste	1066409
```
Select name, population from country where population between 1000000 and 1250000;

Q2. Pick the result you would obtain from this code:
```
      SELECT name, population
      FROM world
      WHERE name LIKE "Al%"
```
```
Albania	3200000
Algeria	32900000
```

Q3. Select the code which shows the countries that end in A or L?
```
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'
```
Q4.  Pick the result from the query
```
SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe'
```
```
name	length(name)
Italy	5
Malta	5
Spain	5
```
Here are the first few rows of the world table:
name	region	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
...
Q5. Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000
```
```
Andorra	936
```
Q6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000?
```
select name, area, population from world where area > 50000 and population < 10000000;
```
Q7. Select the code that shows the population density of China, Australia, Nigeria and France
```
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')
```
 
### SELECT from World Tutorial

name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Albania	Europe	28748	2831741	12960000000
Algeria	Africa	2381741	37100000	188681000000
Andorra	Europe	468	78115	3712000000
Angola	Africa	1246700	20609294	100990000000
...

Q1. Observe the result of running this SQL command to show the name, continent and population of all countries
```
select name, continent, population from world
```

Q2. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
```
select name from world where population > 200000000;
```

Q3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
```
select name, GDP/population from world where population > 200000000;
```

Q4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
```
select name, population/1000000 from world where continent like 'South America';
```

Q5. Show the name and population for France, Germany, Italy?
```
select name, population from world where name in ('France', 'Germany', 'Italy');
```

Q6. Show the countries which have a name that includes word United? 
```
select name from world where name like '%United%';
```

Q7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.

Show the countries that are big by area or big by population. Show name, population and area.
```
select name, population, area from world where area > 3000000 or population > 250000000

Q8. Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
```
select name, population, area from world where area > 3000000 xor population > 250000000
```
Q9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.
```
select name, round(population/1000000, 2), round(GDP/1000000000, 2) from world where continent like 'South America';
```

Q11. Greece has capital Athens.
Each of the strings 'Greece', and 'Athens' has 6 characters.
Show the name and capital where the name and the capital have the same number of characters.
You can use the LENGTH function to find the number of characters in a string
```
SELECT name,   
       capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)
```

#### Q12. The capital of Sweden is Stockholm. Both words start with the letter 'S'.

#### Show the name and the capital where the first letters of each match. Don't include #### countries where the name and the capital are the same word.
#### You can use the function LEFT to isolate the first character.
#### You can use <> as the NOT EQUALS operator.
```
SELECT name, capital
FROM world where name != capital and LEFT(name,1) = LEFT(capital, 1)
```

#### Q13. Equatorial Guinea and Dominican Republic have all of the vowels (a e i o u) in the name. They don't count because they have more than one word in the name.

#### Find the country that has all the vowels and no spaces in its name.

#### You can use the phrase name NOT LIKE '%a%' to exclude characters from your results.
#### The query shown misses countries like Bahamas and Belarus because they contain at least one 'a'
```
SELECT name
   FROM world
WHERE name LIKE '%a%' and name LIKE '%e%' and name LIKE '%i%' and name LIKE '%o%' and name LIKE '%u%' and name not like '% %';
```

### BBC QUIZ

world
name	continent	area	population	gdp
Afghanistan	South Asia	652225	26000000	
Albania	Europe	28728	3200000	6656000000
Algeria	Middle East	2400000	32900000	75012000000
Andorra	Europe	468	64000	
Brazil	South America	8550000	182800000	564852000000
Colombia	South America	1140000	45600000	
Nauru	Asia-Pacific	21	9900	
Uzbekistan	Central Asia	447000	26000000	
...

Q1. Select the code which gives the name of countries beginning with U
```
SELECT name
  FROM world
 WHERE name LIKE 'U%'
```
#### Q2. Select the code which shows just the population of United Kingdom?
```
SELECT population
  FROM world
 WHERE name = 'United Kingdom'
 ```

Q3. Select the answer which shows the problem with this SQL code - the intended result should be the continent of France:
 SELECT continent 
   FROM world 
  WHERE 'name' = 'France'

```
'name' should be name
```

Q4. Select the result that would be obtained from the following code:
 SELECT name, population / 10 
  FROM world 
 WHERE population < 10000
```
Nauru	990
```
#### Q5. Select the code which would reveal the name and population of countries in Europe and Asia
```
SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')
```

Q6. Select the code which would give two rows

```
SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')
```
Q7. Select the result that would be obtained from this code:
SELECT name FROM world
 WHERE continent = 'South America'
   AND population > 40000000
```
Brazil
Colombia
```
###Select from Nobel Tutorial

nobel
yr	subject	winner
1960	Chemistry	Willard F. Libby
1960	Literature	Saint-John Perse
1960	Medicine	Sir Frank Macfarlane Burnet
1960	Medicine	Peter Madawar
...

Q1. Change the query shown so that it displays Nobel prizes for 1950.
```
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 ```

Q2. Show who won the 1962 prize for Literature.
```
select winner from nobel where yr=1962 and subject like 'Literature';
``` 

Q3. Show the year and subject that won 'Albert Einstein' his prize.
```
select yr, subject from nobel where winner like 'Albert Einstein';
```

Q4. Give the name of the 'Peace' winners since the year 2000, including 2000.
```
select winner from nobel where yr >= 2000 and subject='Peace';
```

Q5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
```
select yr, subject, winner from nobel where yr BETWEEN 1980 and 1989 and subject='Literature';
```

Q6. Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama

```
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')
```

Q7. Show the winners with first name John
```
select winner from nobel where winner like 'John %'
```

Q8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
```
select yr, subject, winner from nobel where yr=1984 and subject='Chemistry'
UNION
select yr, subject, winner from nobel 
where yr=1980 and subject='Physics'
```

Q9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine?
```
select yr, subject, winner from nobel where subject NOT IN ('Chemistry', 'Medicine') and yr=1980
```

Q10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
```
select yr, subject, winner from nobel where subject like 'Literature' and yr >= 2004
UNION
select yr, subject, winner from nobel where subject like 'Medicine' and yr<1910
```

Q11. Find all details of the prize won by PETER GRÜNBERG
```
select * from nobel where winner like 'PETER GRÜNBERG'
```

Q12. To be figured out and solved

Q13. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order?
```
select winner, yr, subject from nobel where winner like 'Sir%' order by yr desc, winner asc
```

### Nobel Quiz

nobel
yr	subject	winner
1960	Chemistry	Willard F. Libby
1960	Literature	Saint-John Perse
1960	Medicine	Sir Frank Macfarlane Burnet
1960	Medicine	Peter Medawar
1960	Physics	Donald A. Glaser
1960	Peace	Albert Lutuli
...

Q1. Pick the code which shows the name of winner's names beginning with C and ending in n?
```
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'
```
Q2. Select the code that shows how many Chemistry awards were given between 1950 and 1960?
```
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960
```

Q3.  Pick the code that shows the amount of years where no Medicine awards were given?
```
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')
```

Q4. Select the result that would be obtained from the following code:
SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
```
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet
```

Q5. Select the code which would show the year when neither a Physics or Chemistry award was given?
```
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))
```

Q6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was?
```
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')
```

7. Pick the result that would be obtained from the following code:
 SELECT subject, COUNT(subject) 
   FROM nobel 
  WHERE yr ='1960' 
  GROUP BY subject
```
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1
```

### Select within select tutorial

This tutorial looks at how we can use SELECT statements within SELECT statements to perform more complex queries.

name	continent	area	population	gdp
Afghanistan	Asia	652230	25500100	20343000000
Albania	Europe	28748	2831741	12960000000
Algeria	Africa	2381741	37100000	188681000000
Andorra	Europe	468	78115	3712000000
Angola	Africa	1246700	20609294	100990000000
...

Q1. List each country name where the population is larger than that of 'Russia'.
world(name, continent, area, population, gdp)
```
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
```

Q2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
```
select name from world where GDP/population > (select GDP/population from world where name LIKE 'United Kingdom') and continent like 'Europe';
```

Q3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
```
select name, continent from world 
where name in (select name from world 
where continent IN (select continent from world where name in ('Argentina', 'Australia')) order by name) order by name;
```

Q4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.
```
select name, population from world where population > (select population from world where name like 'Canada') AND population < (select population from world where name like 'Poland')
```

Q6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

```
select name from world where gdp > (select gdp from world where continent like 'Europe' order by gdp desc LIMIT 1)
``` 

Q7. Find the largest country (by area) in each continent, show the continent, the name and the area:

```
select continent, name, area from world where area IN (select max(area) from world group by continent having continent IN (select continent from world group by continent order by area desc))
``` 