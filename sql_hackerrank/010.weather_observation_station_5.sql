problem - https://www.hackerrank.com/challenges/weather-observation-station-5/problem

(select
   city, 
   length(city)
from 
    station
order by 
    length(city) asc,
    city asc 
LIMIT 
    1)
UNION
(select
    city, 
    length(city)
from
    station
order by 
    length(city) desc,
    city asc
LIMIT
    1); 