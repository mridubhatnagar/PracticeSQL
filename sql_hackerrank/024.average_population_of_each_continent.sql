problem - https://www.hackerrank.com/challenges/average-population-of-each-continent/problem
ref on rounding down to nearest integer - https://stackoverflow.com/questions/12361220/how-to-round-down-to-nearest-integer-in-mysql


select
  country.continent,
  round(avg(city.population) -0.5)
from
  country
  JOIN city ON country.code = city.countrycode
GROUP BY
  country.continent