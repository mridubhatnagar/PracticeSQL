problem - https://www.hackerrank.com/challenges/weather-observation-station-11/problem

SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[^aeiou]|[^aeiou]$';

NOTE - REGEXP syntax is different in MySQL and SQLite