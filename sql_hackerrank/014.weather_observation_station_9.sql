problem - https://www.hackerrank.com/challenges/weather-observation-station-9/problem

select
    distinct city
from 
    station
where
    city NOT LIKE 'a%'
    and city NOT LIKE 'e%'
    and city NOT LIKE 'i%'
    and city NOT LIKE 'o%'
    and city NOT LIKE 'u%'
